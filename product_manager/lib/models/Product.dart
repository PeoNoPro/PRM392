import 'dart:convert';

class Product {
  final String id;
  final String name;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  Product copyTo({
    String? id,
    String? name,
    String? image,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  factory Product.fromJson(String json) {

    final data = jsonDecode(json);

    return Product(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      price: data['price'].toDouble(),
    );
  }

  String toJson() {

    return jsonEncode({
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    });

  }

  @override
  String toString() => '''
id: $id
name: $name
image: $image
price: $price
''';
}