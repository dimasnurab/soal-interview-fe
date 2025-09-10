import 'package:main/data/models/users/user_request.dart';
import 'package:shared/shared.dart';

abstract class MainRemoteDS {
  Future<void> searchUsername(UserRequest req);
}

class MainRemoteDsImpl extends MainRemoteDS {
  final ApiHelper apiHelper;
  MainRemoteDsImpl({required this.apiHelper});

  @override
  Future<void> searchUsername(UserRequest req) async {
    var r = await apiHelper.request(
      CanonnicalPath.usernames + '${req.username}',
      method: MethodApiHelper.GET,
    );
  }
}
