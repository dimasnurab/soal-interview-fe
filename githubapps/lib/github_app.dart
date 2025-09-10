import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GithubApps extends StatelessWidget {
  const GithubApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
