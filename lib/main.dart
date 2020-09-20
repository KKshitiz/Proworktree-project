import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/user_list_page.dart';
import 'screens/login_screen_email.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.id,
      routes: {
        SignupPage.id: (context) => SignupPage(),
        LoginPage.id: (context) => LoginPage(),
        UserPage.id: (context) => UserPage(),
        LoginScreenEmail.id: (context) => LoginScreenEmail(),
      },
    );
  }
}
