// ignore_for_file: file_names

abstract class IAuthServices {
  Future<dynamic> signUp({required String email, required String password});
  Future<dynamic> signIn({required String email, required String password});
  Future<dynamic> signOut();
  Future<dynamic> passwordReset({required String email});
}
