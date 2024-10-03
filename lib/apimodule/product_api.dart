import 'dart:convert';
import 'package:ecom2/productmodule/model/productmodel.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  static const String apiUrl = 'https://dummyjson.com/products';

  static Future<List<Products>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        List<Products> products = [];
        if (jsonData['products'] != null) {
          jsonData['products'].forEach((productData) {
            products.add(Products.fromJson(productData));
          });
        }
        print(products);
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error fetching products: $error');
    }
  }
}
