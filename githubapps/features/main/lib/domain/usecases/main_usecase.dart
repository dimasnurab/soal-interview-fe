import 'package:main/data/models/users/user_request.dart';
import 'package:main/domain/entities/user/user_entity.dart';

import '../../data/repositories/main_repositories.dart';

abstract class MainUsecase {
  Future<UserEntity> searchUsername(UserRequest req);
}

class MainUsecaseImpl extends MainUsecase {
  final MainRepositories repo;

  MainUsecaseImpl({required this.repo});

  @override
  Future<UserEntity> searchUsername(UserRequest req) async =>
      await repo.searchUsername(req);
}
