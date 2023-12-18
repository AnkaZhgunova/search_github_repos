import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_repo/domain/export.dart';
import 'package:search_repo/models/export.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(LoadFavoriteState()) {
    on<LoadFavoriteItemsEvent>(
      (event, emit) async {
        final getAllFavoriteRepo = await FavoritesRepository().getAllRepos();
        final List<SearchItemModel> result = List.from(
          getAllFavoriteRepo.map(
            (e) => SearchItemModel(
              name: e.name,
              isFavorite: true,
              htmlUrl: e.htmlUrl,
            ),
          ),
        );
        if (getAllFavoriteRepo.isEmpty) {
          return;
        } else {
          emit(LoadFavoriteState(favoriteRepos: result));
        }
      },
    );
    on<SelectFavoriteEvent>(
      (event, emit) async {
        final chosenRepo = (state as LoadFavoriteState).favoriteRepos![event.index];
        final isFavorite = chosenRepo.isFavorite;
        if (isFavorite) {
          FavoritesRepository().removeRepo((state as LoadFavoriteState).favoriteRepos![event.index]);
        } else {
          FavoritesRepository().purNewRepo((state as LoadFavoriteState).favoriteRepos![event.index]);
        }
        add(LoadFavoriteItemsEvent());
      },
    );
  }
}
