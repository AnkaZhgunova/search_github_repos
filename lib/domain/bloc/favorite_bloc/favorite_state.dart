part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class LoadFavoriteState extends FavoriteState {
  final List<SearchItemModel>? favoriteRepos;
  LoadFavoriteState({this.favoriteRepos});
}
