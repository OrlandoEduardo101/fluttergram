import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergram/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();

  @observable
  String email = '';

  @action
  String setEmail(value) => email = value;

  @observable
  String password = '';

  @action
  String setPasswod(value) => password = value;

  @action
  Future loginWithEmail() async {
    // ignore: unused_local_variable
    User user = await auth.loginWithEmail(email, password).then((value) {
      Modular.to.pushReplacementNamed('/home');
    }).catchError((onError) {
      debugPrint("ERROR: $onError");
    });
  }
}
