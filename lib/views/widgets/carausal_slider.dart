import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom2/controllers/product_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomSlider extends StatelessWidget {
  CustomSlider({super.key});

  ProductController product = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<ProductController>(builder: (controller) {
      return product.isLoading.value == true
          ? const CircularProgressIndicator()
          : CarouselSlider.builder(
              options: CarouselOptions(
                height: 130.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
              ),
              itemCount: product.productItems.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    // image: DecorationImage(
                    //   fit: BoxFit.contain,
                    //   image: NetworkImage(
                    //       product.productItems[index].thumbnail.toString()),
                    // ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.productItems[index].thumbnail.toString(),
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
            );
    });
  }
}
