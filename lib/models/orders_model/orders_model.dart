class OrderModel {
  String? orderId;
  int? orderDate;
  String? orderStatus;
  double? orderSubtotal;
  double? orderDiscount;
  double? deliveryCharges;
  double? orderTotal;
  String? paymentMethod;
  String? shippingAddress;
  String? userId;
  String? userName;
  String? phoneNumber;
  List<OrderItems>? orderItems;

  OrderModel(
      {this.orderId,
      this.orderDate,
      this.orderStatus,
      this.orderSubtotal,
      this.orderDiscount,
      this.deliveryCharges,
      this.orderTotal,
      this.paymentMethod,
      this.shippingAddress,
      this.userId,
      this.userName,
      this.phoneNumber,
      this.orderItems});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderDate = json['order_date'];
    orderStatus = json['order_status'];
    orderSubtotal = json['order_subtotal'].toDouble();
    orderDiscount = json['order_discount'].toDouble();
    deliveryCharges = json['delivery_charges'].toDouble();
    orderTotal = json['order_total'].toDouble();
    paymentMethod = json['payment_method'];
    shippingAddress = json['shipping_address'];
    userId = json['user_id'];
    userName = json['user_name'];
    phoneNumber = json['phone_number'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_date'] = this.orderDate;
    data['order_status'] = this.orderStatus;
    data['order_subtotal'] = this.orderSubtotal;
    data['order_discount'] = this.orderDiscount;
    data['delivery_charges'] = this.deliveryCharges;
    data['order_total'] = this.orderTotal;
    data['payment_method'] = this.paymentMethod;
    data['shipping_address'] = this.shippingAddress;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['phone_number'] = this.phoneNumber;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  String? productId;
  String? productName;
  double? productPrice;
  double? unitPrice;
  int? productQuantity;
  String? productImage;

  OrderItems(
      {this.productId,
      this.productName,
      this.productPrice,
      this.unitPrice,
      this.productQuantity,
      this.productImage});

  OrderItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'].toDouble();
    unitPrice = json['unit_price'].toDouble();
    productQuantity = json['product_quantity'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['unit_price'] = this.unitPrice;
    data['product_quantity'] = this.productQuantity;
    data['product_image'] = this.productImage;
    return data;
  }
}
