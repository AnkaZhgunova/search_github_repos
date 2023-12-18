import 'package:search_repo/api/export.dart';


class FetchReposUsecase {


  Future<ResponsePaginatedList<ResponseRepo>> fetchRepos({required String name}) async {
    final response = await AppRequests().fetchRepos({'q': name, 'page': 5});
    return ResponsePaginatedList<ResponseRepo>.fromJson(response.data, ResponseRepo.fromJson);
  }
}
