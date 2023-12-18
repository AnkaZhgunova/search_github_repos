part of 'search_bloc.dart';

@immutable
abstract class AbstractSearchEvent {}

class SearchEvent extends AbstractSearchEvent {
  final String searchQuery;
  SearchEvent(this.searchQuery);
}

class AddResentSearchEvent extends AbstractSearchEvent {
  AddResentSearchEvent();
}

class SelectFavorite extends AbstractSearchEvent {
  final int index;
  SelectFavorite({required this.index});
}

class SelectFavoriteInHistory extends AbstractSearchEvent {
  final int index;
  SelectFavoriteInHistory({required this.index});
}
