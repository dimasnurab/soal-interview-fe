import 'package:flutter_modular/flutter_modular.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:main/presentation/bloc/main/main_bloc.dart';
import 'package:main/presentation/bloc/search/search_bloc.dart';
import 'package:main/presentation/ui/main_screen.dart';
import 'package:main/presentation/ui/splash_screen.dart';
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
            if (state.statusState == MainStatusState.unknown) {
              return const SplashScreen();
            }

            return BlocProvider(
              create: (context) =>
                  SearchBloc(usecase: Modular.get<MainUsecase>()),
              child: const MainScreen(),
            );
          },
        ),
      ),
    ),
  ];
}
