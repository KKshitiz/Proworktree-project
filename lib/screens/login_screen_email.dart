import 'package:Proworktree/screens/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:Proworktree/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:Proworktree/widgets/page_heading.dart';
import 'signup_screen.dart';

class LoginScreenEmail extends StatefulWidget {
  static const String id = '/loginemail';
  @override
  _LoginScreenEmailState createState() => _LoginScreenEmailState();
}

class _LoginScreenEmailState extends State<LoginScreenEmail> {
  final _auth = FirebaseAuth.instance;
  bool isSpinning = false;

  String emailAddress;
  String password;
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
                    heading: 'Login',
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
                            final user = await _auth.signInWithEmailAndPassword(
                                email: emailAddress, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, UserPage.id);
                            }
                          } catch (e) {
                            print('Exception:$e');
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
                      FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignupPage.id);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
