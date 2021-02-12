import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/modules/splash_screen/splash_scree_page.dart';

class SplashScreenModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => SplashScreenPage()),
      ];

  static Inject get to => Inject<SplashScreenModule>.of();
}
