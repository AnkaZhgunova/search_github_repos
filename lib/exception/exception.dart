

class ParseJsonException<T> implements Exception {
  final String message;
  final dynamic json;
  final dynamic e;

  ParseJsonException._(this.message, this.json, this.e);

  factory ParseJsonException.fromType(T type, Map<String, dynamic>? json, dynamic e) {
    return ParseJsonException<T>._('Failed to parse $type: $e', json, e);
  }

  factory ParseJsonException.fromTypeAsList(
      T type,
      List<Map<String, dynamic>>? json,
      dynamic e,
      ) {
    return ParseJsonException<T>._('Failed to parse $type: $e', json, e);
  }

  @override
  String toString() {
    return '$message\njson: $json';
  }
}
