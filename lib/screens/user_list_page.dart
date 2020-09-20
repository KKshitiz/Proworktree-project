import 'package:Proworktree/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:Proworktree/utilities/user_api.dart';
import 'package:Proworktree/widgets/user_list_tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserPage extends StatefulWidget {
  static const String id = '/user';

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();
  User loggedInUser;
  GoogleSignInAccount loggedInGoogleUser;

  @override
  void initState() {
    super.initState();
    getLoggedInUser();
  }

  void getLoggedInUser() async {
    try {
      final user = _auth.currentUser;
      final userGoogle = _googleAuth.currentUser;
      if (user != null) {
        loggedInUser = user;
      } else {
        loggedInGoogleUser = userGoogle;
        print(loggedInGoogleUser.displayName);
      }
    } catch (e) {
      print('exception: $e');
    }
  }

  Future<List> _userList = UserApi.getUserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(colors: kUserCardGradient),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Welcome, ${loggedInUser == null ? 'Guest' : loggedInUser.email.split('@')[0]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () async {
                    await _auth.signOut();
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Log out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UserListTiles(userList: _userList),
        ],
      ),
    );
  }
}
