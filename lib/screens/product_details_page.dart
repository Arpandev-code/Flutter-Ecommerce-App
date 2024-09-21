import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productImage});
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productImage;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Product Image
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              widget.productImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.productName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "\$${widget.productPrice}",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
