import 'package:chopspick/models/my_user.dart';

abstract class AuthBase {
  Future<MyUser?> currentUser();

  Future<bool> signOut();

  Future<MyUser?> signInWithGoogle();

  Future<MyUser?> signInWithEmailAndPassword(String email, String sifre);

  Future<MyUser?> createUserWithEmailAndPassword(String email, String sifre);

  Future<bool> passwordReset(String email);
}
