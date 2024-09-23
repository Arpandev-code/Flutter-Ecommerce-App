import 'package:ecom2/models/productmodel.dart';
import 'package:ecom2/services/product_api.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productItems = <Products>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      List<Products> products = await ProductAPI.getProducts();
      productItems.value = products;
      isLoading(false);
    } catch (error) {
      print('Error fetching products: $error');
    }
  }
}
