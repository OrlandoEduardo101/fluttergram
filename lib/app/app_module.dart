import 'package:dio/dio.dart';
import 'package:fluttergram/app/splash/splash/splash_page.dart';
import 'modules/auth/login/login_module.dart';
import 'modules/auth/register/register_module.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/auth/repository/auth_repository.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/app/app_widget.dart';
import 'package:fluttergram/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        $AuthController,
        $AuthRepository,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [

        ModularRouter('/', child: (_, args) => SplashPage()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/register', module: RegisterModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
