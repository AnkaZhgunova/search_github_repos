import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_repo/domain/export.dart';
import 'package:search_repo/models/export.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<AbstractSearchEvent, SearchState> {
  final _searchUsecase = FetchReposUsecase();
  SearchBloc() : super(RecentSearchState()) {
    on<SearchEvent>((event, emit) async {
      if (state is SearchResultsState && (state as SearchResultsState).name == event.searchQuery) {
        return;
      }
      emit(SearchResultsState(name: event.searchQuery));

      await _searchUsecase.fetchRepos(name: event.searchQuery).then(
        (repos) async {
          final List<SearchItemModel> result = [];
          for (final repo in repos.items) {
            result.add(
              SearchItemModel(
                name: repo.name,
                isFavorite: false,
                htmlUrl: repo.htmlUrl,
              ),
            );
          }
          if (state is SearchResultsState &&
              (state as SearchResultsState).name == event.searchQuery) {
            emit((state as SearchResultsState).copyWith(
              repos: result,
            ));
          }
        },
        onError: (_) {
          if (state is SearchResultsState &&
              (state as SearchResultsState).name == event.searchQuery) {
            emit((state as SearchResultsState).copyWith(
              repos: [],
              errorMessage: 'Something went wrong',
            ));
          } else {
            emit(
              SearchResultsState(
                errorMessage: 'Something went wrong',
                name: event.searchQuery,
              ),
            );
          }
        },
      );
    });
    on<SelectFavorite>(
      (event, emit) {
        final oldRepo = (state as SearchResultsState).repos![event.index];
        final oldIsFavorite = oldRepo.isFavorite;
        final newRepo = SearchItemModel(
          name: oldRepo.name,
          htmlUrl: oldRepo.htmlUrl,
          isFavorite: !oldIsFavorite,
        );
        (state as SearchResultsState).repos![event.index] = newRepo;
        emit((state as SearchResultsState).copyWith(repos: (state as SearchResultsState).repos));

        if (oldIsFavorite) {
          FavoritesRepository().removeRepo(newRepo);
        } else {
          FavoritesRepository().purNewRepo(newRepo);
        }
      },
    );
    on<SelectFavoriteInHistory>((event, emit) {
      //useless for this moment
    });
    on<AddResentSearchEvent>((event, emit) {
      // I haven't figured out how to do this
    });
  }
}
