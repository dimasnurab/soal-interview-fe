import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:main/presentation/bloc/main/main_bloc.dart';
import 'package:shared/shared.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Modular.get<MainBloc>().add(ChangeStatusState(MainStatusState.authorize));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          ImageAssetsApp.logoAppWhite,
          width: 180,
          height: 180,
        ),
      ),
    );
  }
}
