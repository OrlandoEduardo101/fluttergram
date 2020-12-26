import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.deepPurpleAccent,),
          Center(
            child: Container(
            width: 600,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(
                color: Colors.grey,
                width: 1,
                ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 30
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefix: Icon(Icons.account_circle),
                    labelText: 'email'
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  onChanged: controller.setEmail,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefix: Icon(Icons.lock),
                    labelText: 'password'
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  onChanged: controller.setPasswod
                ),
                Padding(
                  padding:EdgeInsets.fromLTRB(18, 50, 18, 9),
                  child: RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(18, 9, 18, 9),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    onPressed: controller.loginWithEmail
                    ),
                  )

              ],
              ),
              )
          ),
          )
        ],
        )
    );
  }
}
