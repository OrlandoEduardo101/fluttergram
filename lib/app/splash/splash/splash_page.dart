import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disposer = autorun((_) {
      final auth = Modular.get();
      if (auth.status == AuthStatus.login) {
        debugPrint('Home');
        Modular.to.pushReplacementNamed('/home');
      } else {
        debugPrint('Login');
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CircularProgressIndicator(), Text('Loading...')],
        ),
      ),
    );
  }
}
