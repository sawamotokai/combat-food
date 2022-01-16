import 'package:firebase_auth/firebase_auth.dart';
import 'package:combat_food/services/api.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> emailPasswordSignUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // TODO: API call to create a user document with information
      // var res = await postReq();
      // print(res.statusCode);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> emailPasswordSignIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> getUserToken() async {
    if (user == null) return "User not logged in";
    return await user!.getIdToken(true);
  }
}
