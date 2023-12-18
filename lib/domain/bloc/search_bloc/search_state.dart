part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class RecentSearchState extends SearchState {
  final List<SearchItemModel>? recentSearches;

  RecentSearchState({this.recentSearches});

  RecentSearchState copyWith({
    List<SearchItemModel>? recentSearches,
  }) =>
      RecentSearchState(recentSearches: recentSearches ?? this.recentSearches);
}

class SearchResultsState extends SearchState {
  final String name;
  final List<SearchItemModel>? repos;
  final String? errorMessage;
  SearchResultsState({
    required this.name,
    this.repos,
    this.errorMessage,
  });

  SearchResultsState copyWith({
    String? errorMessage,
    List<SearchItemModel>? repos,
  }) =>
      SearchResultsState(
        name: name,
        errorMessage: errorMessage ?? this.errorMessage,
        repos: repos ?? this.repos,
      );
}
