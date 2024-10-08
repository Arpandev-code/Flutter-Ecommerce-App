import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BuildCartEmptyView extends StatelessWidget {
  const BuildCartEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 90),
          child: Column(
            children: [
              Lottie.asset(
                "assets/images/empty_shopping_cart.json",
                height: 200,
              ),
              const SizedBox(height: 10),
              const Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                textAlign: TextAlign.center,
                "Just relax, let us help you find some first class products",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 131, 131, 131),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  backgroundColor: const Color.fromARGB(255, 153, 16, 187),
                  minimumSize: const Size(90, 45),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Start Shopping",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
