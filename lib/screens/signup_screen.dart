import 'package:Proworktree/screens/login_screen_email.dart';
import 'package:Proworktree/screens/user_list_page.dart';
import 'package:Proworktree/widgets/page_heading.dart';
import 'package:flutter/material.dart';
import 'package:Proworktree/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupPage extends StatefulWidget {
  static const String id = '/signup';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;
  String emailAddress;
  String password;
  bool isSpinning = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isSpinning,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: kUserCardGradient),
          ),
          padding: EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageHeading(
                    heading: 'Sign Up',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          fillColor: Colors.white,
                          hintText: 'Enter email',
//                hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (text) {
                          emailAddress = text;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          fillColor: Colors.white,
                          hintText: 'Enter password',
                        ),
                        onChanged: (text) {
                          password = text;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isSpinning = true;
                          });
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: emailAddress, password: password);
                            if (newUser != null) {
                              Navigator.pushNamed(context, UserPage.id);
                            }
                          } catch (e) {
                            print('Error occured: $e');
                          }
                          setState(() {
                            isSpinning = false;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreenEmail.id);
                    },
                    child: Text(
                      'Already a user? Login.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
