import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = [].obs;

  double get total {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price!;
    }
    return total;
  }

  void addToCart(product) {
    cartItems.add(product);
  }

  void removeFromCart(product) {
    cartItems.remove(product);
  }
}
