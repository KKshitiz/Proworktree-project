import 'package:flutter/material.dart';

class LoginScreenEmail extends StatefulWidget {
  static const String id = '/loginemail';
  @override
  _LoginScreenEmailState createState() => _LoginScreenEmailState();
}

class _LoginScreenEmailState extends State<LoginScreenEmail> {
  String emailAddress;
  String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            decoration: InputDecoration(hintText: 'Enter email'),
            onChanged: (text) {
              emailAddress = text;
            },
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            textAlign: TextAlign.center,
            obscureText: true,
            decoration: InputDecoration(hintText: 'Enter password'),
            onChanged: (text) {
              password = text;
            },
          ),
          RaisedButton(
            onPressed: null,
            child: Text('Login'),
          ),
        ],
      ),
    ));
  }
}
