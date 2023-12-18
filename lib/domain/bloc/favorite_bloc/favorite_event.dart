part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class LoadFavoriteItemsEvent extends FavoriteEvent {}

class SelectFavoriteEvent extends FavoriteEvent {
  final int index;
  SelectFavoriteEvent({required this.index});
}
