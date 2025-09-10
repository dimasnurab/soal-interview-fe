import 'package:main/data/models/users/user_request.dart';
import 'package:main/data/models/users/user_response.dart';
import 'package:shared/shared.dart';

abstract class MainRemoteDS {
  Future<UserResponse> searchUsername(UserRequest req);
}

class MainRemoteDsImpl extends MainRemoteDS {
  final ApiHelper apiHelper;
  MainRemoteDsImpl({required this.apiHelper});

  @override
  Future<UserResponse> searchUsername(UserRequest req) async {
    var r = await apiHelper.request(
      CanonnicalPath.usernames + '${req.username}',
      method: MethodApiHelper.GET,
    );
    return UserResponse.fromJson(r.data);
  }
}
