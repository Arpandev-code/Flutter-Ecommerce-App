import 'package:ecom2/controllers/cart_controller.dart';
import 'package:ecom2/controllers/wishlist_controller.dart';
import 'package:ecom2/views/widgets/build_card_view.dart';
import 'package:ecom2/views/widgets/build_cart_empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/build_wishlist_empty_view.dart';
import '../widgets/build_wishlist_view.dart';

// ignore: must_be_immutable
class WishlistPage extends StatefulWidget {
  WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          "WISHLIST",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: GetX<WishlistController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: controller.wishlistItems.isNotEmpty
              ? BuildWishlistView(
                  total: controller.total,
                  wishlistItem: controller.wishlistItems)
              : const BuildWishlistEmptyView(),
        );
      }),
    );
  }
}
