import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_state_test/StateWatcher.dart';
import 'package:flutter_state_test/data/isolatedData.dart';
import 'package:flutter_state_test/models/comment.dart';
import 'package:flutter_state_test/utils/task.dart';
import 'package:observable/observable.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void invokeModelAction() async {
    // only serializable things can be sent
    loadFromIsolate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              LinearProgressIndicator(),
              StateWatcher(
                  // combining modules
                  observables: [isolatedList],
                  builder: (observables) {
                    final ObservableList<Comment> varietiesList =
                        observables[0];

                    return Expanded(
                        child: Scrollbar(
                            child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: varietiesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Comment comment = varietiesList[index];
                        return Text('${comment.id} ${comment.name}',
                            style: Theme.of(context).textTheme.body1);
                      },
                    )));
                  })
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: invokeModelAction,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
