import 'package:product_manager/models/Product.dart';
import 'package:product_manager/controllers/ProductControllers.dart';
import 'dart:io';
import 'package:product_manager/validators/ProductValidator.dart';

class View{
  static void showMainMenu(){
    print('\n =========Product Manager=============');
    print('========================================');
    print('1. Display all product in store.');
    print('2. Find by Name.');
    print('3. Find by ID(ex: 01,02,03,....');
    print('4. Sort by(id,name,price,..).');
    print('5. Add Product.');
    print('6. Edit Product.');
    print('7. Delete Product.');
    print('0. EXIT.');
    print('==========================================');
    stdout.write('Enter your choice: ');
  }

  static void displayProducts(List<Product> products, String title){
    print('\n $title (${products.length} product): ');
    if(products.isEmpty){
      print('Not have product in store.');
      return;
    }
    for(int i = 0;i<products.length;i++){
      print('${i+1}.${products[i]}');
    }
  }

  static void displayProduct(Product? product){
    if(product==null){
      print('Not find product you want to search!');
    }else{
      print('\n${product}');
    }
  }

  static String? input(String lable){
    stdout.write('$lable: ');
    return stdin.readLineSync();
  }

  static void showMessage(String message) {
    print('\n$message');
  }

  static double? inputPrice(){
    while(true){
      stdout.write('Enter the price of product: ');
      String? priceStr = stdin.readLineSync();
      if(priceStr == null){
        return null;
      }
      try{
        double price  = double.parse(priceStr);
        if(!ProductValidator.isValidPrice(price)){
          print('Price must greater than 0!!');
          continue;
        }
        return price;
      }catch(e){
        print('Price error!!');
      }
    }
  }

  static Product? inputNewProduct(){
    print('\n ADD PRODUCT: ');
    String id =
    ProductControllers.generateId();
    print('ID: $id');
    String? name = input('Name');
    if(name == null || !ProductValidator.isValidName(name)){
      print('Name invalid!');
      return null;
    }
    String? image = input('Image');
    if(image == null || !ProductValidator.isValidImage(image)){
      print('Image invalid!');
      return null;
    }
    double? price = inputPrice();
    if(price == null){
      return null;
    }

    return Product(
      id: id,
      name: name,
      image: image,
      price: price,
    );
  }
}