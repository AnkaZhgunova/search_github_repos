class SearchItemModel {
  final String name;
  final String htmlUrl;
  final bool isFavorite;
  SearchItemModel({
    required this.name,
    required this.htmlUrl,
    required this.isFavorite,
  });

  SearchItemModel copyWithNewValue({bool? isFavorite}) {
    return SearchItemModel(
      name: name,
      htmlUrl: htmlUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
