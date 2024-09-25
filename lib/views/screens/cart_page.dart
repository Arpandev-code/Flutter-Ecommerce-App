import 'package:ecom2/controllers/cart_controller.dart';
import 'package:ecom2/views/widgets/build_card_view.dart';
import 'package:ecom2/views/widgets/build_cart_empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = Get.put(CartController());

  bool showCartPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          "CART",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: GetX<CartController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: cartController.cartItems.isNotEmpty
              ? BuildCardView(
                  total: controller.total,
                  cartItem: controller.cartItems,
                )
              : const BuildCartEmptyView(),
        );
      }),
    );
  }
}
