import 'package:main/data/models/repo/repo_request.dart';
import 'package:main/data/models/repo/repo_response.dart';
import 'package:main/data/models/users/user_request.dart';
import 'package:main/data/models/users/user_response.dart';
import 'package:shared/shared.dart';
import 'package:intl/intl.dart';
import '../../models/stared/stared_request.dart';

abstract class MainRemoteDS {
  Future<UserResponse> searchUsername(UserRequest req);
  Future<List<RepoResponse>> getRepositoriesByUsername(RepoRequest req);
  Future<List<RepoResponse>> getStarredUrl(StaredRequest req);
  Future<List<RepoResponse>> getTrendingRepo();
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

  @override
  Future<List<RepoResponse>> getRepositoriesByUsername(RepoRequest req) async {
    var r = await apiHelper.request(
      req.path,
      method: MethodApiHelper.GET,
      queryParameters: req.toJson(),
    );

    return List<RepoResponse>.from(r.data.map((x) => RepoResponse.fromJson(x)));
  }

  @override
  Future<List<RepoResponse>> getStarredUrl(StaredRequest req) async {
    var r = await apiHelper.request(
      req.path.replaceAll('{/owner}{/repo}', ''),
      method: MethodApiHelper.GET,
    );
    return List<RepoResponse>.from(r.data.map((x) => RepoResponse.fromJson(x)));
  }

  @override
  Future<List<RepoResponse>> getTrendingRepo() async {
    var now = DateTime.now();
    var format = DateFormat('yyyyy-MM-dd').format(now);
    var r = await apiHelper.request(
      CanonnicalPath.repositories,
      method: MethodApiHelper.GET,
      queryParameters: {
        'q': 'pushed:>$format',
        'sort': 'stars',
        'order': 'desc',
        'per_page': 10,
      },
    );

    return List<RepoResponse>.from(
      r.data['items'].map((x) => RepoResponse.fromJson(x)),
    );
  }
}
