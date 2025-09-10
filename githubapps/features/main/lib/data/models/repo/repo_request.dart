class RepoRequest {
  final String path;
  final int size;

  RepoRequest({required this.path, required this.size});

  Map<String, dynamic> toJson() => {"per_page": size};
}
