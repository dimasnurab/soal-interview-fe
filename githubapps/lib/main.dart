import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:githubapps/app_module.dart';
import 'package:githubapps/github_app.dart';
import 'package:shared/api/constant.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    ModularApp(
      module: AppModule(apiBaseUrl: ConstantApp.baseUrl),
      child: GithubApps(),
    ),
  );
}
