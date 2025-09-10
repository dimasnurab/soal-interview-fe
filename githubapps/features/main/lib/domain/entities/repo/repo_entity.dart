class RepoEntity {
  final int? id;
  final String? name;
  final String? fullName;
  final String? htmlUrl;
  final String? description;
  final bool? isPrivate;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final int? forksCount;
  final int? openIssuesCount;
  final String? defaultBranch;
  final String? ownerAvatarUrl;
  final int? starredCount;
  final String? updatedAt;
  RepoEntity({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    this.description,
    required this.isPrivate,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
    required this.forksCount,
    required this.openIssuesCount,
    required this.defaultBranch,
    required this.ownerAvatarUrl,
    required this.starredCount,
    required this.updatedAt,
  });
}
