import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttergram/app/shared/auth/repository/interfaces/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository authRepository = Modular.get();

  @observable
  User user;

  @observable
  AuthStatus status = AuthStatus.loading;

  _AuthControllerBase() {
    authRepository.getUser().then(setUser);
  }

  @action
  Future getUser() async {
    user = authRepository.getUser() as User;
    return user;
  }

  @action
  void setUser(User value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  @action
  Future loginWithEmail(String email, String password) async {
    user = await authRepository.getEmailPasswordLogin(email, password);
  }

  @action
  Future getCreateUser(String email, String password) async {
    user = await authRepository.getCreateUser(email, password);
    return user;
  }

  Future logOut() {
    return authRepository.getLogout();
  }
}

enum AuthStatus { loading, login, logoff }
