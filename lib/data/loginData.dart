import 'package:observable/observable.dart';

class _Login extends PropertyChangeNotifier {
  String _username = '1q2w3e';

  String get username => _username;

  set username(String newValue) {
    print(newValue);
    _username = notifyPropertyChange(#username, _username, newValue);
  }
}

class _Profile extends PropertyChangeNotifier {
  String _username = '';
  String get username => _username;
  set username(String newValue) =>
      _username = notifyPropertyChange(#username, _username, newValue);

  _Profile(_Login loginData) {
    loginData.changes.listen(onData);
  }

  onData(List<ChangeRecord> changes) {
    print('from Profile $changes');
  }
}

final _Login loginData = _Login();
final _Profile profileData = _Profile(loginData);