class FlashSaleProductModel {
  final int id;
  final String name;
  final double price;
  final double discountedPrice;
  final String imageUrl;
  final double rating;
  final int totalOrder;
  FlashSaleProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.discountedPrice,
      required this.imageUrl,
      required this.rating,
      required this.totalOrder});
  factory FlashSaleProductModel.fromJson(Map<String, dynamic> json) {
    return FlashSaleProductModel(
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
