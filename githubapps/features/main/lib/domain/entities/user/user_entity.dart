class UserEntity {
  final String? login;
  final String? avatarUrl;
  final String? name;
  final String? bio;
  final String? location;
  final int? publicRepos;
  final int? followers;
  final int? following;

  UserEntity({
    required this.login,
    required this.avatarUrl,
    required this.name,
    required this.bio,
    required this.location,
    required this.publicRepos,
    required this.followers,
    required this.following,
  });
}
