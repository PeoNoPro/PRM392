import 'dart:io';

import 'models/Product.dart';
import 'controllers/ProductControllers.dart';
import 'views/View.dart';

void main() {
  View.showMessage('PRODUCT MANAGER RUNNING!');
  while (true) {
    View.showMainMenu();
    String? choice = stdin.readLineSync();
    switch (choice?.trim()) {
      case'1':
        View.displayProducts(
          ProductControllers.listProduct,
          'List Product',
        );
        break;

      case'2':
        stdout.write('Enter product name: ');
        String keyword = stdin.readLineSync() ?? '';
        List<Product> result = ProductControllers.listProduct.where((p) => p.name.toLowerCase().contains(keyword.toLowerCase(),),).toList();
        View.displayProducts(result, 'result search',);
        break;

      case'3':
        stdout.write('Enter ID: ');
        String id = stdin.readLineSync() ?? '';
        Product? product = ProductControllers.searchById(id);
        View.displayProduct(product);
        break;

      case'4':
        print('\n========= SORT MENU =========');
        print('1. Sort By Name Increasing');
        print('2. Sort By Name Decreasing');
        print('3. Sort By ID Increasing');
        print('4. Sort By ID Decreasing');
        print('5. Sort By Price Increasing');
        print('6. Sort By Price Decreasing');
        stdout.write('Choose: ');
        String? sortChoice = stdin.readLineSync();
        List<Product> sortedProducts = [];
        switch (sortChoice) {
          case'1':
            sortedProducts = ProductControllers.sortByNameIncreasing();
            break;

          case'2':
            sortedProducts = ProductControllers.sortByNameDecreasing();
            break;

          case'3':
            sortedProducts = ProductControllers.sortByIdIncreasing();
            break;

          case'4':
            sortedProducts = ProductControllers.sortByIdDecreasing();
            break;

          case'5':
            sortedProducts = ProductControllers.sortByPriceIncreasing();
            break;

          case'6':
            sortedProducts = ProductControllers.sortByPriceDecreasing();
            break;
          default:

            View.showMessage('Invalid choice! Try again!');
        }
        View.displayProducts(sortedProducts, 'Sort result',);
        break;

      case'5':
        Product? newProduct = View.inputNewProduct();
        if(newProduct == null){
          View.showMessage('Add Product Failed!');
        }else{
          bool result = ProductControllers.addPrice(newProduct);
          if (result) {
            View.showMessage('Add Product Success!');
          }else{
            View.showMessage(
                'Product Already Exists!');
          }
        }
        break;

      case'6':
        stdout.write('Enter ID need update: ');
        String idEdit = stdin.readLineSync() ?? '';
        Product? oldProduct = ProductControllers.searchById(idEdit);
        if(oldProduct == null){
          View.showMessage('Product Not Found!');
          break;
        }
        print('\nOLD PRODUCT:');
        View.displayProduct(oldProduct);
        print('\nENTER NEW INFORMATION');
        stdout.write('Name: ');
        String name = stdin.readLineSync() ?? '';
        stdout.write('Image: ');
        String image = stdin.readLineSync() ?? '';
        double? price = View.inputPrice();
        if(price == null){
          View.showMessage('Update Failed!');
          break;
        }
        Product updatedProduct = oldProduct.copyTo(
          name: name,
          image: image,
          price: price,
        );
        bool updated = ProductControllers.updateProduct(idEdit, updatedProduct,);
        if(updated){

          View.showMessage('Update Success!');
        } else {

          View.showMessage('Update Failed!');
        }
        break;
      case'7':
        stdout.write('Enter ID need delete: ');
        String deleteId = stdin.readLineSync() ?? '';
        bool deleted = ProductControllers.deleteProduct(deleteId);
        if (deleted) {
          View.showMessage('Delete Success!');
        } else {
          View.showMessage('Delete Failed!');
        }
        break;

      case '0':
        View.showMessage('GOODBYE!');
        return;
      default:
        View.showMessage('Invalid choice!');
    }
  }
}