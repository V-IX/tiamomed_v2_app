List<T> fromJsonToList<T> ({
  required dynamic json,
  required T Function(Map<String, dynamic> map) fromJsonMethod,
}) {
  final List<T> responseList = <T>[];

  if (json is List) {
    responseList.addAll(
      json.whereType<Map<String, dynamic>>().map(fromJsonMethod),
    );
  } else if (json is Map<String, dynamic>) {
    responseList.add(fromJsonMethod(json));
  }

  return responseList;
}

T? fromJsonToObjectOrNull<T> ({
  required dynamic json,
  required T Function(Map<String, dynamic> map) fromJsonMethod,
}) {
  if (json is Map<String, dynamic>) {
    return fromJsonMethod(json);
  }
  return null;
}