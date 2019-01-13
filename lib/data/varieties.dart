import 'package:flutter_state_test/utils/listUtils.dart';
import 'package:observable/observable.dart';

final ObservableMap<String, String> _varietiesMap = ObservableMap();
final ObservableList<String> _varietiesList = ObservableList();

ObservableMap<String, String> get varietiesMap => _varietiesMap;
ObservableList<String> get varietiesList => _varietiesList;

// main runner
void varietiesMain () {
  _varietiesMap.changes.listen((data) {
    final newContents = mapValuesToSortedList(_varietiesMap);
    _varietiesList.replaceRange(0, _varietiesList.length, newContents);
  });
}

// actions
void varietyAdd() {
  final id = 1 + _varietiesMap.length;
  _varietiesMap['$id'] = 'variety $id';
}
