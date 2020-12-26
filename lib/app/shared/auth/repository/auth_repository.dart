import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/auth_repository_interface.dart';

part 'auth_repository.g.dart';

@Injectable()
class AuthRepository implements IAuthRepository {
  final Dio client;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<User> getCreateUser(String email, String password) async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  @override
  Future<User> getEmailPasswordLogin(String email, String password) async {
    final User user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }

  @override
  Future<User> getUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}
