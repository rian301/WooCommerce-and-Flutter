import 'package:minha_loja/app/modules/home/home_module.dart';
import 'package:minha_loja/app/modules/login/login_module.dart';
import 'package:minha_loja/app/modules/splash_screen/splash_screen_module.dart';
import 'package:minha_loja/app/shared/configuration/configuration_wp.dart';
import 'package:dio/dio.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:minha_loja/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind(
          (i) => Dio(
            BaseOptions(
              baseUrl: ConfigurationWp.url,
              contentType: ConfigurationWp.contentType,
              // headers: {HttpHeaders.contentTypeHeader: "application/json"},
            ),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", module: SplashScreenModule()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
