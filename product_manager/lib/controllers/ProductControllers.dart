import 'package:product_manager/models/Product.dart';

class ProductControllers{
  static List<Product> listProduct = [
    Product(id: "01", name: "Banana", image: "null", price: 50000,
    ),
    Product(id: '02', name: 'Apple', image: 'null', price: 20000,
    ),
    Product(id: '03', name: 'Orange', image: 'null', price: 40000,
    ),
    Product(id: '04', name: 'StrawBerry', image: 'null', price: 80000,
    ),

  ];

  static Product? searchById(String id){
    try{
      return listProduct.firstWhere((p)=> p.id == id);
    }catch(e){
      return null;
    }
  }

  static List<Product> sortByNameIncreasing(){
    return List.from(listProduct)..sort((a,b)=> a.name.compareTo(b.name));
  }

  static List<Product> sortByNameDecreasing(){
    return List.from(listProduct)..sort((a,b)=> b.name.compareTo(a.name));
  }

  static List<Product> sortByIdIncreasing(){
    return List.from(listProduct)..sort((a,b)=> a.id.compareTo(b.id));
  }

  static List<Product> sortByIdDecreasing(){
    return List.from(listProduct)..sort((a,b)=> b.id.compareTo(a.id));
  }

  static List<Product> sortByPriceIncreasing(){
    return List.from(listProduct)..sort((a,b)=> a.price.compareTo(b.price));
  }
  static List<Product> sortByPriceDecreasing(){
    return List.from(listProduct)..sort((a,b)=> b.price.compareTo(a.price));
  }

  static bool addProduct(Product product,){
    bool existed = listProduct.any((p)=> p.id == product.id);
    if(existed){
      return false;
    }
    listProduct.add(product);
    return true;
  }

  static bool updateProduct(String id, Product updateProduct,){
    int index = listProduct.indexWhere((s)=>s.id == id);
    if(index ==-1){
      return false;
    }
    listProduct[index] = updateProduct;//khởi tạo 1 thằng mới, add vào index của tk đã xóa
    return true;
  }

  static bool deleteProduct(String id,){
    int before = listProduct.length;
    listProduct.removeWhere((p)=>p.id == id);
    return listProduct.length<before;
  }

  static List<Product> searchByName(String keyword){
    return listProduct.where((p) => p.name.toLowerCase().contains(keyword.toLowerCase())).toList();
  }

  static String generateId() {
    if (listProduct.isEmpty) {
      return '01';
    }
    int lastId = int.parse(listProduct.last.id);
    int newId = lastId + 1;
    return newId.toString().padLeft(2, '0');
  }

  static void increasePrice(double amount) {listProduct = listProduct.map((p) {
      return p.copyTo(price: p.price + amount,);
  }).toList();
  }
}