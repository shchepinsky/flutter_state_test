import 'package:observable/observable.dart';
import 'package:flutter/widgets.dart';

// watches models and updates child
class StateWatcher extends StatefulWidget {
  final List<Observable> observables;
  final dynamic builder;

  StateWatcher({@required this.builder, @required this.observables });

  @override
  State createState() {
    return new ConnectState(this.builder, this.observables);
  }
}

//
class ConnectState<T> extends State<StateWatcher> {
  final Function builder;
  final List<Observable> observables;

  ConnectState(this.builder, this.observables) {
    for (var observable in this.observables) {
      observable.changes.listen(onData);
    }
  }

  void onData(_) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return this.builder(observables);
  }
}