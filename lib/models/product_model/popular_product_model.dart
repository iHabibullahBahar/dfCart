class PopularProductModel {
  final int id;
  final String name;
  final double price;
  final double discountedPrice;
  final String imageUrl;
  final double rating;
  final int totalOrder;
  PopularProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.discountedPrice,
      required this.imageUrl,
      required this.rating,
      required this.totalOrder});
  factory PopularProductModel.fromJson(Map<String, dynamic> json) {
    return PopularProductModel(
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
