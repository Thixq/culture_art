abstract class IAuthServices {
  Future<dynamic> signUp({required String email, required String password});
  Future<dynamic> signIn({required String email, required String password});
  Future<dynamic> signOut();
}
