import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class NoInternetConnectionPage extends StatelessWidget {
  const NoInternetConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              "assets/images/Bg_image.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/images/no_internet.json", height: 300),
                  Text(
                    "No Internet Connection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      "Please check your internet connection and try again"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
