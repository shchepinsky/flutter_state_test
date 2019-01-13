Iterable<T> mapValuesToSortedList<T>(Map<String, T> map) {
  int comparator(String id1, String id2) => num.parse(id1) - num.parse(id2);

  final idList = map.keys.toList();
  idList.sort(comparator);

  return idList.map((String key) => map[key]);
}

List<T> parseList<T>(List<dynamic> jsonList, Function parser) {
  final List<T> result = [];
  for (var json in jsonList) {
    try {
      T comment = parser(json);
      result.add(comment);
    } catch (err) {
      print(err);
    }
  }
  return result;
}
