import 'dart:convert';

class Product {
  final String name;
  final String description;
  final String images;
  final String price;
  final String category;

  Product({
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'images': images,
      'price': price,
      'category': category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      images: map['images'] ?? [],
      price: map['price'] ?? '',
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
