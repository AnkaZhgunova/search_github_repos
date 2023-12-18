import 'package:dio/dio.dart';

class AppRequests {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Connection': 'Keep-Alive',
        'User-Agent': 'request',
      },
      responseType: ResponseType.json,
      baseUrl: _baseUrl,
    ),
  );

  static const String _baseUrl = "https://api.github.com";

  Future<Response<dynamic>> fetchRepos(Map<String, dynamic> query) async {
    final response = await _dio.get(
      '/search/repositories',
      queryParameters: query,
    );

    return response;
  }
}
