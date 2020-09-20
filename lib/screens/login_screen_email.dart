import 'package:Proworktree/screens/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lottie/lottie.dart';
import 'package:Proworktree/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
      child: SafeArea(
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
                  Heading(),
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
                      RaisedButton(
                        onPressed: () async {
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
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'hero',
          child: Container(
            width: 100,
            height: 100,
            child: Lottie.asset('assets/login_animation.json'),
          ),
        ),
        Text(
          'Login',
          style: kBrandHeadingStyle,
        ),
      ],
    );
  }
}
