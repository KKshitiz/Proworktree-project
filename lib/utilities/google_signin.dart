import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Proworktree/models/user.dart';

class GoogleAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  UserData userData;

  Future<UserData> signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      // Store the retrieved data
      userData = UserData(
          emailAddress: user.email,
          userName: user.displayName,
          imageUrl: user.photoURL);

      return userData;
    }
    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Signed Out");
  }
}
