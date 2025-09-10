import 'package:flutter/material.dart';
import 'package:main/domain/entities/repo/repo_entity.dart';
import 'package:shared/utils/colors_app.dart'
    show ColorsApp, LanguageProgrammingColor;

class RepositoryCard extends StatelessWidget {
  final RepoEntity repo;
  final bool isStarred;
  final bool isTrending;

  const RepositoryCard({
    super.key,
    required this.repo,
    this.isStarred = false,
    this.isTrending = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsApp.gray, width: 1.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildRepoInfo()),
          _buildRepoStatus(),
        ],
      ),
    );
  }

  Widget _buildRepoInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          repo.name ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorsApp.blue,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          repo.description ?? '',
          style: const TextStyle(color: ColorsApp.gray, fontSize: 12),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 6,
          runSpacing: 4,
          children: [
            _buildLang(),
            if (isStarred || isTrending)
              _buildRowIconText(
                Icons.star_border,
                '${repo.stargazersCount ?? 0}',
              ),
            if (isStarred || isTrending)
              _buildRowIconText(
                Icons.fork_left_outlined,
                'forks ${repo.forksCount ?? 0}',
              ),
            if (isStarred || isTrending)
              _buildRowIconText(null, 'Updated on ${repo.updatedAt}'),
          ],
        ),
      ],
    );
  }

  Widget _buildRepoStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsApp.gray, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isStarred
            ? "Star"
            : (repo.isPrivate ?? false || isTrending)
            ? "Private"
            : "Public",
        style: const TextStyle(fontSize: 11, color: ColorsApp.gray),
      ),
    );
  }

  Widget _buildRowIconText(IconData? icon, String value) {
    return Row(
      children: [
        icon == null
            ? const SizedBox()
            : Icon(icon, size: 18, color: ColorsApp.gray),
        const SizedBox(width: 4),
        Text(
          value,
          maxLines: 1,
          style: const TextStyle(color: ColorsApp.gray, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildLang() {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: repo.language?.languageProgramColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          repo.language ?? '',
          style: const TextStyle(color: ColorsApp.gray, fontSize: 12),
        ),
      ],
    );
  }
}
