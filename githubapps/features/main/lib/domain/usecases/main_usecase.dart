import 'package:main/data/models/users/user_request.dart';
import 'package:main/domain/entities/repo/repo_entity.dart';
import 'package:main/domain/entities/user/user_entity.dart';

import '../../data/models/repo/repo_request.dart';
import '../../data/models/stared/stared_request.dart';
import '../../data/repositories/main_repositories.dart';

abstract class MainUsecase {
  Future<UserEntity> searchUsername(UserRequest req);
  Future<List<RepoEntity>> getRepositoriesByUsername(RepoRequest req);
  Future<List<RepoEntity>> getStarredUrl(StaredRequest req);
  Future<List<RepoEntity>> getTrendingRepo();
}

class MainUsecaseImpl extends MainUsecase {
  final MainRepositories repo;

  MainUsecaseImpl({required this.repo});

  @override
  Future<UserEntity> searchUsername(UserRequest req) async =>
      await repo.searchUsername(req);

  @override
  Future<List<RepoEntity>> getRepositoriesByUsername(RepoRequest req) async =>
      await repo.getRepositoriesByUsername(req);

  @override
  Future<List<RepoEntity>> getStarredUrl(StaredRequest req) async =>
      await repo.getStarredUrl(req);

  @override
  Future<List<RepoEntity>> getTrendingRepo() async =>
      await repo.getTrendingRepo();
}
