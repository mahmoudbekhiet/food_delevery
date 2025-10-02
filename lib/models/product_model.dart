class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final int categoryId;
  final String categoryName;
  final double rating;
  final int reviewCount;
  final bool isFavorite;
  final bool isAvailable;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.categoryName,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isFavorite = false,
    this.isAvailable = true,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json['id'].toString()),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: double.parse(json['price'].toString()),
      image: json['image'] ?? '',
      categoryId: int.parse(json['category_id'].toString()),
      categoryName: json['category_name'] ?? '',
      rating: double.parse(json['rating']?.toString() ?? '0.0'),
      reviewCount: int.parse(json['review_count']?.toString() ?? '0'),
      isFavorite: json['is_favorite'] == 1 || json['is_favorite'] == true,
      isAvailable: json['is_available'] == 1 || json['is_available'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'category_id': categoryId,
      'category_name': categoryName,
      'rating': rating,
      'review_count': reviewCount,
      'is_favorite': isFavorite ? 1 : 0,
      'is_available': isAvailable ? 1 : 0,
    };
  }

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? image,
    int? categoryId,
    String? categoryName,
    double? rating,
    int? reviewCount,
    bool? isFavorite,
    bool? isAvailable,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isFavorite: isFavorite ?? this.isFavorite,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}