class UserEntity {
  final String? login;
  final String? avatarUrl;
  final String? name;
  final String? bio;
  final String? location;
  final int? publicRepos;
  final int? followers;
  final int? following;
  final String? pathRepo;
  final String? email;
  final String? gistsUrl;
  final String? pathStarred;
  UserEntity({
    required this.login,
    required this.avatarUrl,
    required this.name,
    required this.bio,
    required this.location,
    required this.publicRepos,
    required this.followers,
    required this.following,
    required this.pathRepo,
    required this.email,
    required this.gistsUrl,
    required this.pathStarred,
  });
}
