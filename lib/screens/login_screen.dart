import 'package:Proworktree/screens/login_screen_email.dart';
import 'package:Proworktree/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:Proworktree/utilities/google_signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Proworktree/utilities/constants.dart';
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
              height: 15,
            ),
            Container(
              color: Colors.blue,
              child: ListTile(
//              focusColor: Colors.blue,
                onTap: () async {
//                GoogleAuth googleAuth = GoogleAuth();
//                UserData userData = await googleAuth.signInWithGoogle();
//                print(userData.userName);
//                print(userData.emailAddress);
//                print(userData.imageUrl);
                },
                title: Text('Login with Google'),
                leading: Icon(Icons.email),
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreenEmail.id);
                },
                title: Text('Login with Email'),
                leading: Icon(Icons.email),
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
