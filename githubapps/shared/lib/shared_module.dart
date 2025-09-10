import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/shared.dart';

class SharedModule extends Module {
  final String apiBaseUrl;
  SharedModule({required this.apiBaseUrl});

  @override
  List<Bind> get binds => [
    Bind((_) => ApiHelper(apiBaseUrl: apiBaseUrl), export: true),
  ];
}
