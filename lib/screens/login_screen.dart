import 'package:Proworktree/screens/login_screen_email.dart';
import 'package:Proworktree/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:Proworktree/utilities/google_signin.dart';
import 'package:Proworktree/models/user.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Lottie.asset('assets/login_animation.json'),
          Text(
            'ProWorkTree',
            style: TextStyle(fontSize: 40),
          ),
          RaisedButton(
            onPressed: () async {
              GoogleAuth googleAuth = GoogleAuth();
              UserData userData = await googleAuth.signInWithGoogle();
              print(userData.userName);
              print(userData.emailAddress);
              print(userData.imageUrl);
            },
            child: Text('Login with google'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginScreenEmail.id);
            },
            child: Text('Login with Email'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, SignupPage.id);
            },
            child: Text('Not a user? Signup.'),
          ),
        ],
      ),
    );
  }
}
