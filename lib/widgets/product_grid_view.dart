import 'package:ecom2/APIService/productmodel.dart';
import 'package:ecom2/screens/product_details_page.dart';
import 'package:ecom2/widgets/productcard.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  final List<Products> products;
  const ProductGridView({super.key, required this.products});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.products.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.7,
        mainAxisSpacing: 20,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => ProductCard(
        price: widget.products[index].price.toString(),
        title: widget.products[index].title.toString(),
        productImageUrl: widget.products[index].thumbnail.toString(),
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                  productName: widget.products[index].title.toString(),
                  productDescription:
                      widget.products[index].description.toString(),
                  productPrice: widget.products[index].price.toString(),
                  productImage: widget.products[index].thumbnail.toString()),
            ),
          );
        },
      ),
    );
  }
}
