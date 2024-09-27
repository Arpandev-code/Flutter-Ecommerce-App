import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom2/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_tracker/progress_tracker.dart';

class BuildCardView extends StatelessWidget {
  final List cartItem;
  final double total;
  BuildCardView({super.key, required this.cartItem, required this.total});
  final CartController controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ProgressTracker(
          currentIndex: 1,
          activeColor: Colors.blue,
          inActiveColor: const Color.fromARGB(255, 189, 189, 189),
          statusList: [
            Status(name: "Cart", icon: Icons.shopping_cart_outlined),
            Status(name: "Address", icon: Icons.location_on_outlined),
            Status(name: "Payment", icon: Icons.payment_outlined),
            Status(name: "Summary", icon: Icons.summarize_outlined),
          ],
        ),
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
            itemCount: cartItem.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 225, 225, 225),
                        borderRadius: BorderRadius.circular(13.0),
                        // border: Border.all(color: Colors.grey),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: cartItem[index].thumbnail.toString(),
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          cartItem[index].title.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          minFontSize: 10,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          '\$ ${cartItem[index].price.toString()}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 17),
                        ),
                        TextButton(
                            onPressed: () {
                              // cartItem.remove(cartItem[index]);
                              controller.removeFromCart(cartItem[index]);
                            },
                            child: const Text("Remove X"))
                      ],
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     Icons.arrow_right_sharp,
                    //     size: 50,
                    //   ),
                    // ),
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
            onPressed: () {},
            child: const Text(
              "Continue",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
