class OrderModel {
  final int id;
  final int userId;
  final String orderNumber;
  final double totalAmount;
  final String status;
  final String paymentMethod;
  final String deliveryAddress;
  final DateTime createdAt;
  final List<OrderItemModel> items;

  OrderModel({
    required this.id,
    required this.userId,
    required this.orderNumber,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
    required this.deliveryAddress,
    required this.createdAt,
    this.items = const [],
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: int.parse(json['id'].toString()),
      userId: int.parse(json['user_id'].toString()),
      orderNumber: json['order_number'] ?? '',
      totalAmount: double.parse(json['total_amount'].toString()),
      status: json['status'] ?? 'pending',
      paymentMethod: json['payment_method'] ?? '',
      deliveryAddress: json['delivery_address'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
      items: json['items'] != null
          ? (json['items'] as List).map((item) => OrderItemModel.fromJson(item)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'order_number': orderNumber,
      'total_amount': totalAmount,
      'status': status,
      'payment_method': paymentMethod,
      'delivery_address': deliveryAddress,
      'created_at': createdAt.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class OrderItemModel {
  final int id;
  final int orderId;
  final int productId;
  final String productName;
  final String productImage;
  final int quantity;
  final double price;

  OrderItemModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: int.parse(json['id'].toString()),
      orderId: int.parse(json['order_id'].toString()),
      productId: int.parse(json['product_id'].toString()),
      productName: json['product_name'] ?? '',
      productImage: json['product_image'] ?? '',
      quantity: int.parse(json['quantity'].toString()),
      price: double.parse(json['price'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'quantity': quantity,
      'price': price,
    };
  }
}