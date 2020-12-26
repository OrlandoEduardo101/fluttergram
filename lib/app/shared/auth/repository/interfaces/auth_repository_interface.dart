import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IAuthRepository implements Disposable {
  Future fetchPost();
  Future<User> getUser();
  Future<User> getEmailPasswordLogin(String email, String password);
  Future getLogout();
  Future<User> getCreateUser(String email, String password);
}
