import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:main/presentation/bloc/main/main_bloc.dart';
import 'package:main/presentation/bloc/search/search_bloc.dart';
import 'package:main/presentation/ui/main/main_screen.dart';
import 'package:main/presentation/ui/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => BlocProvider(
        create: (context) => Modular.get<MainBloc>(),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: state.statusState == MainStatusState.unknown
                  ? const SplashScreen(key: ValueKey('splash'))
                  : MainScreen(key: ValueKey('main')),
            );
          },
        ),
      ),
    ),
  ];
}
