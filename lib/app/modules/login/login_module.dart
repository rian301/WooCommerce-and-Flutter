import 'package:minha_loja/app/modules/login/pages/login_page.dart';
import 'package:minha_loja/app/modules/login/pages/login_register_page.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/shared/repositories/customer_repository.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $LoginController,
        $CustomerRepository,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter("/login-register",
            child: (_, args) => LoginRegisterPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
