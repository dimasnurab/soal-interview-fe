import 'package:flutter_modular/flutter_modular.dart';
import 'package:main/data/datasources/remote/main_remote_ds.dart';
import 'package:main/data/repositories/main_repositories.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:main/presentation/bloc/bloc/main_bloc.dart';
import 'package:main/presentation/ui/main_screen.dart';
import 'package:shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((_) => MainRemoteDsImpl(apiHelper: Modular.get<ApiHelper>())),
    Bind((_) => MainRepositoriesImpl(remoteDS: Modular.get<MainRemoteDS>())),
    Bind((_) => MainUsecaseImpl(repo: Modular.get<MainRepositories>())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => BlocProvider(
        create: (context) => MainBloc(usecase: Modular.get<MainUsecase>()),
        child: MainScreen(),
      ),
    ),
  ];
}
