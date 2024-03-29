import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nabalsi2app/homepage.dart';
import 'package:rxdart/rxdart.dart';

final FirebaseService authService = FirebaseService();
final BehaviorSubject<int> _counter = BehaviorSubject<int>.seeded(0);

class FirebaseService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Observable<User> user;
  Observable<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();

  FirebaseService() {
    user = Observable(_auth.authStateChanges());
    profile = user.switchMap((User u) {
      if (u != null) {
        return _db
            .collection('users')
            .doc(u.uid)
            .snapshots()
            .map((snap) => snap.data());
      } else {
        return Observable.just({});
      }
    });
  }

  Future<User?> googleSignIn(context) async {
    loading.add(true);
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
    final authResult = await _auth.signInWithCredential(credential);
    if (authResult.user != null) {
      Navigator.pushNamed(context, HomePage.id);
    }
    updateUserData(authResult.user!);
    print('signed in${authResult.user?.displayName}');
    loading.add(false);
    return authResult.user;
  }

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection('users').doc(user.uid);
    return ref.set(
      {
        'uid': user.uid,
        'email': user.email,
        'photoUrl': user.photoURL,
        'displayName': user.displayName,
        'lastSeen': DateTime.now(),
      },
    );
  }

  void signOut() {
    _auth.signOut();
  }
}
