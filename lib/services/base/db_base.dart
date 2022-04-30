import 'package:chopspick/models/my_user.dart';

abstract class DBBase {
  Future<bool> saveUser(MyUser myUser);

  Future<MyUser> readUser(String UserID);
}
