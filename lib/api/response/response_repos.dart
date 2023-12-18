import 'dart:developer';

import 'package:search_repo/api/export.dart';
import 'package:search_repo/exception/exception.dart';


class ResponseRepo implements Response{
  final String htmlUrl;
  final String name;

  ResponseRepo({required this.htmlUrl, required this.name});

  factory ResponseRepo.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      log('Failed to parse model ResponseRepo');
      throw ParseJsonException.fromType(ResponseRepo, json, 'something wrong');
    }
    try {
      return ResponseRepo(
        name: json['name'],
        htmlUrl: json['html_url'],
      );
    } catch (e) {
      log('Failed to parse model ResponseRepo ${e.toString()}');
      throw ParseJsonException.fromType(ResponseRepo, json, e);
    }
  }


}
