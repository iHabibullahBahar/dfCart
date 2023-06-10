class ProductDetailsModel {
  int? id;
  String? sku;
  List<String>? categories;
  String? subcategory;
  String? name;
  double? originalPrice;
  double? discountedPrice;
  double? rating;
  int? totalReviews;
  int? totalPurchases;
  String? added;
  bool? freeShipping;
  String? description;
  bool? availability;
  String? brand;
  List<String>? images;
  List<ProductColors>? productColors;
  List<Variants>? variants;
  List<Reviews>? reviews;

  ProductDetailsModel(
      {this.id,
      this.sku,
      this.categories,
      this.subcategory,
      this.name,
      this.originalPrice,
      this.discountedPrice,
      this.rating,
      this.totalReviews,
      this.totalPurchases,
      this.added,
      this.freeShipping,
      this.description,
      this.availability,
      this.brand,
      this.images,
      this.productColors,
      this.variants,
      this.reviews});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    categories = json['categories'].cast<String>();
    subcategory = json['subcategory'];
    name = json['name'];
    originalPrice = json['original_price'].toDouble();
    discountedPrice = json['discounted_price'].toDouble();
    rating = json['rating'].toDouble();
    totalReviews = json['totalReviews'];
    totalPurchases = json['total_purchases'];
    added = json['added'];
    freeShipping = json['free_shipping'];
    description = json['description'];
    availability = json['availability'];
    brand = json['brand'];
    images = json['images'].cast<String>();
    if (json['colors'] != null) {
      productColors = <ProductColors>[];
      json['colors'].forEach((v) {
        productColors!.add(new ProductColors.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['categories'] = this.categories;
    data['subcategory'] = this.subcategory;
    data['name'] = this.name;
    data['original_price'] = this.originalPrice;
    data['discounted_price'] = this.discountedPrice;
    data['rating'] = this.rating;
    data['totalReviews'] = this.totalReviews;
    data['total_purchases'] = this.totalPurchases;
    data['added'] = this.added;
    data['free_shipping'] = this.freeShipping;
    data['description'] = this.description;
    data['availability'] = this.availability;
    data['brand'] = this.brand;
    data['images'] = this.images;
    if (this.productColors != null) {
      data['colors'] = this.productColors!.map((v) => v.toJson()).toList();
    }
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColors {
  int? id;
  String? color;
  double? price;
  int? quantity;
  bool? available;

  ProductColors(
      {this.id, this.color, this.price, this.quantity, this.available});

  ProductColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    price = json['price'].toDouble();
    quantity = json['quantity'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['available'] = this.available;
    return data;
  }
}

class Variants {
  int? id;
  String? variant;

  Variants({this.id, this.variant});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variant = json['variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['variant'] = this.variant;
    return data;
  }
}

class Reviews {
  int? id;
  double? rating;
  String? review;
  String? color;
  int? userId;
  String? userName;
  String? date;

  Reviews(
      {this.id,
      this.rating,
      this.review,
      this.color,
      this.userId,
      this.userName,
      this.date});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'].toDouble();
    review = json['review'];
    color = json['color'];
    userId = json['user_id'];
    userName = json['user_name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['color'] = this.color;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['date'] = this.date;
    return data;
  }
}
