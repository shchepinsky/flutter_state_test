import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter_state_test/models/comment.dart';
import 'package:flutter_state_test/utils/task.dart';
import 'package:http/http.dart';
import 'package:observable/observable.dart';

final ObservableList<Comment> _isolatedList = ObservableList();

ObservableList<Comment> get isolatedList => _isolatedList;

Future<List<Comment>> _load(params) async {
  final url = params['url'];
  Response response = await get(url);
  final List<Map> jsonList = jsonDecode(response.body);
  return jsonList.map(Comment.fromJSON).toList();
}

_mock(SendPort port) async {
  ReceivePort receivePort = ReceivePort();
  port.send(receivePort.sendPort);

  await for (var _ in receivePort) {
    return port.send([
      Comment(
          id: 'id',
          postId: 'postId',
          name: 'name',
          email: 'email',
          body: 'body')
    ]);
  }
}

_mockAsync() async {
  return Future.value([
    Comment(
        id: 'id', postId: 'postId', name: 'name', email: 'email', body: 'body')
  ]);
}

// FIXME: compute does not complete
void loadFromIsolate() async {
  final params = {'url': 'https://jsonplaceholder.typicode.com/comments'};

  final parsedList = await computeAsync(_load, params: params);
  _isolatedList.replaceRange(0, _isolatedList.length, parsedList);
}
