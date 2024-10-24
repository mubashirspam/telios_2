class ListingModel {
  const ListingModel(
    this.name,
    this.category,
    this.id,
    this.categoryList,
  );

  final String name;
  final String id;
  final int category;
  final Map<int, int>? categoryList;
}
