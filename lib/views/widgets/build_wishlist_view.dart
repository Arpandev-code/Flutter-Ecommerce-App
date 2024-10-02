import 'package:ecom2/controllers/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';

import '../../controllers/cart_controller.dart';

class BuildWishlistView extends StatelessWidget {
  final List wishlistItem;
  final double total;
  BuildWishlistView(
      {super.key, required this.wishlistItem, required this.total});

  final wishlistController = Get.put(WishlistController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Divider(),
        const SizedBox(height: 10),
        const Divider(
            // color: Colors.black,
            // height: 2,
            ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(
                //  thickness: 1,
                //  color: Colors.black,
                //   height: 2,
                ),
            itemCount: wishlistItem.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  children: [
                    Image.network(
                      fit: BoxFit.contain,
                      wishlistItem[index].thumbnail.toString(),
                      height: 100,
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Marquee(
                            child: Text(wishlistItem[index].title.toString())),
                        Text('\$ ${wishlistItem[index].price.toString()}'),
                        TextButton(
                            onPressed: () {
                              wishlistController
                                  .removeFromwhishlist(wishlistItem[index]);
                            },
                            child: const Text("Remove X"))
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(),
        ListTile(
          title: Text('\$ ${total.toStringAsFixed(2)}'),
          subtitle: InkWell(
              onTap: () {},
              child: const Text(
                "VIEW PRICE DETAILS",
                style: TextStyle(color: Colors.purple),
              )),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              backgroundColor: const Color.fromARGB(255, 153, 16, 187),
              minimumSize: const Size(100, 50),
            ),
            onPressed: () {
              cartController.cartItems.addAll(wishlistController.wishlistItems);
              wishlistController.wishlistItems.clear();
              Get.snackbar(
                "Cart",
                "Items added to cart",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            },
            child: const Text(
              "Add to cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
