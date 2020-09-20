import 'package:Proworktree/screens/login_screen_email.dart';
import 'package:Proworktree/screens/signup_screen.dart';
import 'package:Proworktree/screens/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:Proworktree/utilities/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _googleAuth = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: kUserCardGradient),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'hero',
              child: Lottie.asset('assets/login_animation.json'),
            ),
            Text(
              'ProWorkTree',
              textAlign: TextAlign.center,
              style: kBrandHeadingStyle,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                final userData = await _googleAuth.signIn();
                Navigator.pushNamed(context, UserPage.id);
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.person_pin),
                    Text(
                      'Login with Google',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginScreenEmail.id);
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.email),
                    Text('Login with Email'),
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, SignupPage.id);
              },
              child: Text(
                'Not a user? Signup.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
