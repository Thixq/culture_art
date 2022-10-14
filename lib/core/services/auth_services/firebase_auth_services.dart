import 'package:culture_art/core/services/auth_services/Iauth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices implements IAuthServices {
  FirebaseAuthServices({required this.auth});
  final FirebaseAuth auth;

  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      return Future.error(error.message.toString());
    }
  }

  @override
  Future signOut() async {
    await auth.signOut();
  }

  @override
  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      return Future.error(error.message!);
    }
  }

  @override
  Future<void> passwordReset({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      return Future.error(error.message!);
    }
  }
}
