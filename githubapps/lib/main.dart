import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:githubapps/app_module.dart';
import 'package:githubapps/github_app.dart';
import 'package:shared/api/constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      module: AppModule(apiBaseUrl: ConstantApp.baseUrl),
      child: GithubApps(),
    ),
  );
}
