import 'package:firebase_auth/firebase_auth.dart';
import 'package:combat_food/services/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  String getUserId() {
    if (user == null) return "User not logged in";
    return user!.uid;
  }

  Future<void> emailPasswordSignUp(
      String email, String password, Map<String, String> data) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var url = '${dotenv.env["BASE_URL"]}/api/user/signup';
      var res = await postReq(url, data);
      print(res.statusCode);
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
