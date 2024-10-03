import 'package:ecom2/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchfield extends StatelessWidget {
  final VoidCallback onSearchTap;
  Searchfield({super.key, required this.onSearchTap});

  TextEditingController searchtextController = TextEditingController();

  dispose() {
    searchtextController.dispose();
  }

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchtextController,
      onSubmitted: (value) {
        // productController.searchProducts(value);
        onSearchTap();
      },
      decoration: InputDecoration(
        hintText: 'Search product...',
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
        // suffixIcon: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.mic, color: Colors.grey[600]),
        //       onPressed: () {},
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.camera_alt_outlined, color: Colors.grey[600]),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple),
        ),
      ),
    );
  }
}
