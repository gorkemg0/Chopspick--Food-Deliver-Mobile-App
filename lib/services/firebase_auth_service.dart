import 'package:chopspick/global/component/dialogs.dart';
import 'package:chopspick/models/my_user.dart';
import 'package:chopspick/services/base/auth_base.dart';
import 'package:chopspick/services/errors.dart';
import 'package:chopspick/services/firebase_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthenticationService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FireStoreDBService _fireStoreDBService = Get.find();

  @override
  Future<MyUser?> currentUser() async {
    try {
      User? user = await _firebaseAuth.currentUser;
      return _userFromFiresbase(user);
    } catch (e) {
      //catch
      return null;
    }
  }

  MyUser? _userFromFiresbase(User? user) {
    if (user == null) {
      return null;
    } else {
      return MyUser(userID: user.uid, email: user.email);
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      //catch
      return false;
    }
  }

  @override
  Future<MyUser?> signInWithGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

      if (_googleUser != null) {
        GoogleSignInAuthentication _googleAuth =
            await _googleUser.authentication;
        if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
          AuthCredential credential = GoogleAuthProvider.credential(
              idToken: _googleAuth.idToken,
              accessToken: _googleAuth.accessToken);
          UserCredential authResult =
              await _firebaseAuth.signInWithCredential(credential);
          User? user = authResult.user;
          return _userFromFiresbase(user);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      //catch
      return null;
    }
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCreateResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if ((userCreateResult.user) != null) {
        MyUser _myUser =
            MyUser(userID: userCreateResult.user!.uid, email: userCreateResult.user!.email);
        var result = await _fireStoreDBService.saveUser(_myUser);
        if (result == true) {
          return _myUser;
        } else {
          return null;
        }
      }
    } on FirebaseAuthException catch (e) {
      Dialogs().errorDialog(contentText: Errors.show(e.code));
      return null;
      //catch
    }
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFiresbase(result.user);
    } on FirebaseAuthException catch (e) {
      Dialogs().errorDialog(contentText: Errors.show(e.code));
      return null;
    }
  }

  @override
  Future<bool> passwordReset(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }
}
