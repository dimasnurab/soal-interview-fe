import 'package:flutter_modular/flutter_modular.dart';
import 'package:main/main.dart';
import 'package:shared/shared_module.dart';
import 'package:shared/utils/routes_name.dart';

class AppModule extends Module {
  final String apiBaseUrl;
  AppModule({required this.apiBaseUrl});

  @override
  List<Module> get imports => [SharedModule(apiBaseUrl: apiBaseUrl)];
  @override
  List<ModularRoute> get routes => [
    ModuleRoute(RoutesName.initial, module: MainModule()),
  ];
}
