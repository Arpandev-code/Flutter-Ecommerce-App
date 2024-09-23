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
    return SizedBox(
      child: CarouselSlider.builder(
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
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                      product.productItems[index].thumbnail.toString()),
                ),
                borderRadius: BorderRadius.circular(10.0)),
          );
        },
      ),
    );
  }
}
