import 'package:flutter/material.dart';
import 'package:progress_tracker/progress_tracker.dart';

class BuildCardView extends StatelessWidget {
  final List cartItem;
  final double total;
  const BuildCardView({super.key, required this.cartItem, required this.total});

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Image.network(
                      fit: BoxFit.contain,
                      cartItem[index].thumbnail.toString(),
                      height: 100,
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem[index].title.toString()),
                        Text(cartItem[index].price.toString()),
                        TextButton(
                            onPressed: () {}, child: const Text("Remove X"))
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_right_sharp,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(),
        ListTile(
          title: Text('\$ ${total.toString()}'),
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
              Navigator.pop(context);
            },
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
