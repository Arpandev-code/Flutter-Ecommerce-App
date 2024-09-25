import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlistItems = [].obs;
  double get total {
    double total = 0.0;
    for (var item in wishlistItems) {
      total += item.price!;
    }
    return total;
  }

  void addTowhishlist(product) {
    wishlistItems.add(product);
  }

  void removeFromwhishlist(product) {
    wishlistItems.remove(product);
  }
}
