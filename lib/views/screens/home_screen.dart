import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom2/controllers/product_controller.dart';
import 'package:ecom2/views/screens/product_details_page.dart';
import 'package:ecom2/views/widgets/carausal_slider.dart';
import 'package:ecom2/views/widgets/discount_banner.dart';
import 'package:ecom2/views/widgets/productcard.dart';
import 'package:ecom2/views/widgets/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  final productController = Get.put(ProductController());

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
              CustomSlider(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GetX<ProductController>(builder: (controller) {
                  return controller.isLoading.value
                      ? LoadingAnimationWidget.flickr(
                          leftDotColor: const Color(0xFF1A1A3F),
                          rightDotColor: const Color(0xFFEA3799),
                          size: 50,
                        )
                      : GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.productItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                            price:
                                controller.productItems[index].price.toString(),
                            title:
                                controller.productItems[index].title.toString(),
                            productImageUrl: controller
                                .productItems[index].thumbnail
                                .toString(),
                            onPress: () {
                              Get.to(
                                ProductDetailsPage(
                                  productName: controller
                                      .productItems[index].title
                                      .toString(),
                                  productDescription: controller
                                      .productItems[index].description
                                      .toString(),
                                  productPrice: controller
                                      .productItems[index].price
                                      .toString(),
                                  productImage: controller
                                      .productItems[index].thumbnail
                                      .toString(),
                                ),
                              );
                            },
                          ),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
