import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom2/APIService/productmodel.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final List<Products> products;
  const CustomSlider({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 130.0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
      ),
      items: products.map((p) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(p.thumbnail.toString()),
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
            );
          },
        );
      }).toList(),
    );
  }
}
