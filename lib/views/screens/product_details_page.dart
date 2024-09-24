import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productImage,
      required this.images,
      required this.isLoading});
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productImage;
  final List<String> images;
  final bool isLoading;

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
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.23,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return CachedNetworkImage(
                      imageUrl: images[index],
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                  ),
                ),
              ),
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
                    Text(productName,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 10),
                    Text("\$ $productPrice",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.orange, fontSize: 30)),
                    const SizedBox(height: 10),
                    Text(
                      productDescription,
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
                    )
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Center(
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
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
