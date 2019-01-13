import 'package:flutter/material.dart';
import 'package:flutter_state_test/data/loginData.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController(text: loginData.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Center(
                child: TextFormField(
      decoration: InputDecoration(labelText: "Username"),
      controller: usernameController,
    ))));
  }

  _onUsernameChange() {
    if (usernameController.text != loginData.username) {
      loginData.username = usernameController.text;
    }
  }

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_onUsernameChange);
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }
}
