import '../../../domain/entities/repo/repo_entity.dart' show RepoEntity;

class RepoResponse {
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

  RepoResponse({
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
  });

  factory RepoResponse.fromJson(Map<String, dynamic> json) {
    return RepoResponse(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      htmlUrl: json['html_url'],
      description: json['description'],
      isPrivate: json['private'],
      stargazersCount: json['stargazers_count'],
      watchersCount: json['watchers_count'],
      language: json['language'],
      forksCount: json['forks_count'],
      openIssuesCount: json['open_issues_count'],
      defaultBranch: json['default_branch'],
      ownerAvatarUrl: json['owner']?['avatar_url'] ?? '',
    );
  }
}

extension RepoResponseMapper on RepoResponse {
  RepoEntity toEntity() {
    return RepoEntity(
      id: id,
      name: name,
      fullName: fullName,
      htmlUrl: htmlUrl,
      description: description,
      isPrivate: isPrivate,
      stargazersCount: stargazersCount,
      watchersCount: watchersCount,
      language: language,
      forksCount: forksCount,
      openIssuesCount: openIssuesCount,
      defaultBranch: defaultBranch,
      ownerAvatarUrl: ownerAvatarUrl,
    );
  }
}
