import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> signinWithgoogle() async {
    bool result = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credinatial = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      UserCredential userCredential =
          await auth.signInWithCredential(credinatial);
      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          // add data user to firestore
          await firestore.collection('users').doc(user.uid).set({
            "usename": user.displayName,
            "uid": user.uid,
            "ProfilePhoto": user.photoURL,
            "lastseenDate": DateTime.now()
          });
        }
        result = true;
      }
      return result;
    } catch (error) {
      // print
    }
    return result;
  }
}
