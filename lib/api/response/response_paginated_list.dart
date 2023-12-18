import 'dart:developer';

import 'package:search_repo/exception/exception.dart';

abstract class Response {}

/// A meta class that represents a list of same-typed response data.
class ResponsePaginatedList<E extends Response> {
  final List<E> items;
final int totalCount;
final bool incompleteResults;
  ResponsePaginatedList._({
    required this.items,
    required this.totalCount,
    required this.incompleteResults,
  });

  /// json - passed json
  /// itemsFromJson - a factory constructor of the respective response model
  factory ResponsePaginatedList.fromJson(
      Map<String, dynamic>? json, E Function(Map<String, dynamic>? json) itemFromJson) {
    if (json == null) {
      log('Failed to parse model ResponsePaginatedList<$E>');
      throw ParseJsonException.fromType(ResponsePaginatedList<E>, json, 'json is null');
    }
    try {
      return ResponsePaginatedList<E>._(
        // because .map need (dynamic) => dynamic
        // ignore: inference_failure_on_untyped_parameter
        items: List<E>.from(json['items'].map((j) => itemFromJson(j))),
        totalCount: json['total_count'],
        incompleteResults: json['incomplete_results'],
      );
    } catch (e) {
      log('Failed to parse model ResponsePaginatedList<$E>. ${e.toString()}');
      throw ParseJsonException.fromType(ResponsePaginatedList<E>, json, e);
    }
  }
}
