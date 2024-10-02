import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom2/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.03,
    required this.onPress,
    required this.title,
    required this.productImageUrl,
    required this.price,
    this.product,
  });

  final double width, aspectRetio;
  final String title;
  final dynamic product;
  final String productImageUrl;
  final VoidCallback onPress;
  final String price;
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 229, 228, 228),
          ),
          borderRadius: BorderRadius.circular(10)),
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF979797).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Hero(
                    tag: productImageUrl,
                    child: CachedNetworkImage(
                      imageUrl: productImageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )),
            ),
            Marquee(
              direction: Axis.horizontal,
              textDirection: TextDirection.ltr,
              animationDuration: Duration(seconds: 1),
              backDuration: Duration(milliseconds: 5000),
              pauseDuration: Duration(milliseconds: 2500),
              directionMarguee: DirectionMarguee.oneDirection,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ $price',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  onPressed: () {
                    if (cartController.cartItems.contains(product)) {
                      Get.snackbar(
                        "Error",
                        "Product already in cart",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color.fromARGB(255, 245, 22, 22),
                        colorText: Colors.white,
                      );
                      return;
                    }
                    cartController.addToCart(product);
                    Get.snackbar(
                      "Success",
                      "Product added to cart",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: const Color.fromARGB(255, 71, 159, 8),
                      colorText: const Color.fromARGB(255, 255, 255, 255),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
