class ProductModel {
  final int id;
  final String name;
  final double price;
  final double discountedPrice;
  final String imageUrl;
  final double rating;
  final int totalOrder;
  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.discountedPrice,
      required this.imageUrl,
      required this.rating,
      required this.totalOrder});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      price: json["price"].toDouble(),
      discountedPrice: json["discounted_price"].toDouble(),
      imageUrl: json["image"],
      rating: json["rating"].toDouble(),
      totalOrder: json["total_order"],
    );
  }
}
