import 'package:hive/hive.dart';
import 'package:search_repo/api/export.dart';
import 'package:search_repo/domain/export.dart';
import 'package:search_repo/models/export.dart';

class FavoritesRepository {
  static final FavoritesRepository _singleton = FavoritesRepository._internal();

  factory FavoritesRepository() => _singleton;

  FavoritesRepository._internal() {
    Hive.registerAdapter(FavoriteRepoAdapter());
  }

  static const _boxName = "github.repos.favorite_repository";

  Future<List<ResponseRepo>> getAllRepos() async =>
      (await Hive.openBox<ResponseRepo>(_boxName)).values.toList();

  Future<void> purNewRepo(SearchItemModel model) async =>
      (await Hive.openBox<ResponseRepo>(_boxName))
          .put(model.htmlUrl, ResponseRepo(name: model.name, htmlUrl: model.htmlUrl));

  Future<void> removeRepo(SearchItemModel model) async =>
      (await Hive.openBox<ResponseRepo>(_boxName)).delete(model.htmlUrl);

  Future<bool> isFavourite(SearchItemModel model) async =>
      (await Hive.openBox<ResponseRepo>(_boxName))
          .values
          .toList()
          .map((e) => e.htmlUrl)
          .contains(model.htmlUrl);

  void closeRepo() => Hive.box<ResponseRepo>(_boxName).close();
}
