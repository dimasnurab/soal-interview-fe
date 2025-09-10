import 'package:main/data/models/users/user_request.dart';
import 'package:main/data/models/users/user_response.dart';
import 'package:main/domain/entities/user/user_entity.dart';

import '../datasources/remote/main_remote_ds.dart';

abstract class MainRepositories {
  Future<UserEntity> searchUsername(UserRequest req);
}

class MainRepositoriesImpl extends MainRepositories {
  final MainRemoteDS remoteDS;

  MainRepositoriesImpl({required this.remoteDS});

  @override
  Future<UserEntity> searchUsername(UserRequest req) async {
    var r = await remoteDS.searchUsername(req);
    return r.toEntity();
  }
}
