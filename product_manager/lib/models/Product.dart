import 'dart:ffi';

class Product {
  final String id;
  final String name;
  final String image;
  final double price;

  Product({required this.id,
    required this.name,
    required this.image,
    required this.price});

  Product copyTo({
    String? id, String? name, String? image, double? price
  }){
    return Product(id: id?? this.id,
        name: name?? this.name,
        image: image?? this.image,
        price: price?? this.price
    );
  }

  @override
  String toString() => '''
id: $id
name: $name
image: $image
price: $price
''';

  factory Product.fromMap(Map<String,dynamic> map){
    return Product(id: map['id'],
        name: map['name'],
        image: map['image'],
        price: map['price']);
  }
  Map<String,dynamic> toMap() =>{
    'id': id,
    'name': name,
    'image': image,
    'price': price,
  };


}

