import 'package:main/data/models/repo/repo_response.dart';
import 'package:main/data/models/users/user_request.dart';
import 'package:main/data/models/users/user_response.dart';
import 'package:main/domain/entities/repo/repo_entity.dart';
import 'package:main/domain/entities/user/user_entity.dart';

import '../datasources/remote/main_remote_ds.dart';
import '../models/repo/repo_request.dart';
import '../models/stared/stared_request.dart' show StaredRequest;

abstract class MainRepositories {
  Future<UserEntity> searchUsername(UserRequest req);
  Future<List<RepoEntity>> getRepositoriesByUsername(RepoRequest req);
  Future<List<RepoEntity>> getStarredUrl(StaredRequest req);
  Future<List<RepoEntity>> getTrendingRepo();
}

class MainRepositoriesImpl extends MainRepositories {
  final MainRemoteDS remoteDS;

  MainRepositoriesImpl({required this.remoteDS});

  @override
  Future<UserEntity> searchUsername(UserRequest req) async {
    var r = await remoteDS.searchUsername(req);
    return r.toEntity();
  }

  @override
  Future<List<RepoEntity>> getRepositoriesByUsername(RepoRequest req) async {
    var r = await remoteDS.getRepositoriesByUsername(req);

    return List<RepoEntity>.from(r.map((e) => e.toEntity()));
  }

  @override
  Future<List<RepoEntity>> getStarredUrl(StaredRequest req) async {
    var r = await remoteDS.getStarredUrl(req);
    return List<RepoEntity>.from(r.map((e) => e.toEntity()));
  }

  @override
  Future<List<RepoEntity>> getTrendingRepo() async {
    var r = await remoteDS.getTrendingRepo();
    return List<RepoEntity>.from(r.map((e) => e.toEntity()));
  }
}
