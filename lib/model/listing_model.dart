class ListingModel {
  const ListingModel(
    this.name,
    this.category,
    this.id,
    this.categoryList,
  );

  final String name;
  final String id;
  final String category;
  final Map<String, dynamic>? categoryList;
}
