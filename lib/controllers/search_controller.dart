import 'package:get/get.dart';
import 'product_controller.dart';

class SearchController extends GetxController {
  var searchedProductsList = [].obs;
  RxBool isLoading = false.obs;
  final productController = Get.put(ProductController());

  searchProducts(String query) async {
    final searchData = productController.productItems
        .map((product) =>
            product.title!.toLowerCase().contains(query.toLowerCase())
                ? product
                : null)
        .toList();
    searchedProductsList.value = searchData;
  }
}
