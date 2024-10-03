import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom2/controllers/cart_controller.dart';
import 'package:ecom2/controllers/wishlist_controller.dart';
import 'package:ecom2/models/productmodel.dart';
import 'package:ecom2/views/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productImage,
      required this.images,
      required this.isLoading,
      required this.products});
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productImage;
  final List<String> images;
  final Products products;
  final bool isLoading;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final cartController = Get.put(CartController());

  final wishlistController = Get.put(WishlistController());
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Obx(() => GestureDetector(
                onTap: () {
                  if (wishlistController.wishlistItems
                      .contains(widget.products)) {
                    Get.snackbar(
                        "Wishlisted", "Item already added to wishlist");
                    return;
                  } else if (cartController.cartItems
                      .contains(widget.products)) {
                    Get.snackbar("Error", "Item already in cart");
                    return;
                  }
                  Get.snackbar("Wishlisted", "Item added to wishlist");
                  wishlistController.addTowhishlist(widget.products);
                },
                onDoubleTap: () {
                  if (wishlistController.wishlistItems
                      .contains(widget.products)) {
                    Get.snackbar("Wishlisted", "Item removed from wishlist");
                    wishlistController.removeFromwhishlist(widget.products);
                  }
                },
                child: Padding(
                    padding: EdgeInsets.only(right: width * 0.03),
                    child: !wishlistController.wishlistItems
                            .contains(widget.products)
                        ? Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )),
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget.productImage,
                child: SizedBox(
                  height: height * 0.23,
                  width: double.infinity,
                  child: widget.images.length == 1
                      ? CachedNetworkImage(
                          imageUrl: widget.images[0],
                          fit: BoxFit.contain,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error))
                      : CarouselSlider.builder(
                          itemCount: widget.images.length,
                          itemBuilder: (context, index, realIndex) {
                            return CachedNetworkImage(
                              imageUrl: widget.images[index],
                              fit: BoxFit.contain,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            );
                          },
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                          ),
                        ),
                ),
              ),
              widget.images.length == 1
                  ? const SizedBox()
                  : DotIndicator(
                      index: currentIndex, count: widget.images.length),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 30, bottom: 10),
                width: double.infinity,
                height: height * 0.4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.productName,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 10),
                    Text("\$ ${widget.productPrice}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.orange, fontSize: 30)),
                    const SizedBox(height: 10),
                    Text(
                      widget.productDescription,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 138, 138, 138),
                            height: 1.7,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "See More Details >",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.09,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(206, 241, 241, 241),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Row(
                        children: [],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height * 0.13,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (cartController.cartItems.contains(widget.products)) {
                        Get.snackbar(
                          "Error",
                          "Product already in cart",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor:
                              const Color.fromARGB(255, 245, 22, 22),
                          colorText: Colors.white,
                        );
                        return;
                      }
                      cartController.addToCart(widget.products);
                      Get.snackbar(
                        "Success",
                        "Product added successfully",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    },
                    child: Container(
                      width: width * 0.7,
                      height: height * 0.085,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
