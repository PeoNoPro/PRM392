class ProductValidator {

  static bool isValidPrice(double price) {
    return price >= 0;
  }

  static bool isValidName(String name) {
    return name.trim().isNotEmpty;
  }

  static bool isValidImage(String image) {
    return image.trim().isNotEmpty;
  }
}