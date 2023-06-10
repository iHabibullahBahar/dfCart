class CategoryModel {
  final int categoryIndexNo;
  final int categoryId;
  final String categoryName;
  final String image;

  CategoryModel(
      {required this.categoryIndexNo,
      required this.categoryId,
      required this.categoryName,
      required this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryIndexNo: json['category_index_no'],
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      image: json['image'],
    );
  }
}
