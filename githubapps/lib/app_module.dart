import 'package:flutter_modular/flutter_modular.dart';
import 'package:main/data/datasources/remote/main_remote_ds.dart';
import 'package:main/data/repositories/main_repositories.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:main/main.dart';
import 'package:main/presentation/bloc/main/main_bloc.dart';
import 'package:shared/shared.dart';
import 'package:shared/shared_module.dart';
import 'package:shared/utils/routes_name.dart';

class AppModule extends Module {
  final String apiBaseUrl;
  AppModule({required this.apiBaseUrl});

  @override
  List<Module> get imports => [SharedModule(apiBaseUrl: apiBaseUrl)];

  @override
  List<Bind> get binds => [
    Bind((_) => MainRemoteDsImpl(apiHelper: Modular.get<ApiHelper>())),
    Bind((_) => MainRepositoriesImpl(remoteDS: Modular.get<MainRemoteDS>())),
    Bind((_) => MainUsecaseImpl(repo: Modular.get<MainRepositories>())),

    Bind.singleton((_) => MainBloc(usecase: Modular.get<MainUsecase>())),
  ];
  @override
  List<ModularRoute> get routes => [
    ModuleRoute(RoutesName.initial, module: MainModule()),
  ];
}
