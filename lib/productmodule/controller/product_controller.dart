import 'package:ecom2/productmodule/model/productmodel.dart';
import 'package:ecom2/apimodule/product_api.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productItems = <Products>[].obs;
  var isLoading = true.obs;
  var filteredProducts = <Products>[].obs;
  var categories = <String>[].obs;
  var selectedCategory = ''.obs;
  var currentIndex = 0.obs;
  var searchedProducts = [].obs;
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
      var categorySet = products.map((product) => product.category!).toSet();
      categories.value = categorySet.toList();
      filteredProducts.value = products;
      isLoading(false);
    } catch (error) {
      print('Error fetching products: $error');
    }
  }

  void filterByCategory(String category) {
    if (category.isEmpty || category == 'All') {
      filteredProducts.value = productItems; // Show all products
    } else {
      filteredProducts.value = productItems
          .where((product) => product.category == category)
          .toList();
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
