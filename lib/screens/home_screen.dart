import 'package:ecom2/APIService/product_api.dart';
import 'package:ecom2/APIService/productmodel.dart';
import 'package:ecom2/widgets/carausal_slider.dart';
import 'package:ecom2/widgets/discount_banner.dart';
import 'package:ecom2/widgets/product_grid_view.dart';
import 'package:ecom2/widgets/searchfield.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late List<Products> _products = [];
  bool _isLoading = false;
  Future<void> _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Products> products = await ProductAPI.getProducts();
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (error) {
      print('Error fetching products: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(
                "https://static.vecteezy.com/system/resources/thumbnails/024/326/967/small_2x/woman-hands-in-indian-greeting-pose-namaste-vector.jpg"),
          ),
          title: Text(
            "Hello",
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Let's shop",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.purple,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          child: Column(
            children: [
              const Searchfield(),
              const SizedBox(
                height: 10,
              ),
              const DiscountBanner(),
              const SizedBox(
                height: 10,
              ),
              CustomSlider(products: _products),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ProductGridView(products: _products),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
