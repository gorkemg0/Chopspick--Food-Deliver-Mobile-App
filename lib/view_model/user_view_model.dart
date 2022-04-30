import 'package:chopspick/models/my_user.dart';
import 'package:chopspick/repository/user_repository.dart';
import 'package:chopspick/services/base/auth_base.dart';
import 'package:get/get.dart';

enum ViewState { idle, Busy }

class UserViewModel extends GetxController implements AuthBase {
  Rx<ViewState> _state = ViewState.idle.obs;
  UserRepository _userRepository = Get.find<UserRepository>();
  Rx<MyUser?> _user = MyUser(userID: "", email: "").obs;
  String? emailErrorText;
  String? passwordErrorText;

  ViewState get state => _state.value;

  MyUser? get user => _user.value;

  set state(ViewState value) {
    _state.value = value;
  }

  UserViewModel() {
    currentUser();
  }

  @override
  Future<MyUser?> currentUser() async {
    try {
      state = ViewState.Busy;
      _user.value = await _userRepository.currentUser();
      return _user.value;
    } catch (e) {
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      var result = await _userRepository.signOut();
      if (result == true) {
        _user.value = MyUser(userID: "", email: "");
      }
      return result;
    } catch (e) {
      return false;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<MyUser?> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user.value = await _userRepository.signInWithGoogle();
      return _user.value;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      state = ViewState.Busy;
      _user.value =
          await _userRepository.createUserWithEmailAndPassword(email, password);
      return _user.value;
    } catch (e) {
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      state = ViewState.Busy;
      _user.value =
          await _userRepository.signInWithEmailAndPassword(email, password);
      return _user.value;
    } catch (e) {
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  Future<MyUser?> readUser(String userID) async {
    var myUser = await _userRepository.readUser(userID);
    return myUser;
  }

  @override
  Future<bool> passwordReset(String email) async {
    var result = await _userRepository.passwordReset(email);
    return result;
  }
}
