import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../controllers/auth_controller.dart';
import 'home_screen.dart';
import 'login_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.15,
            child: Image.asset(
              "assets/images/Bg_image.png",
              fit: BoxFit.fitHeight,
              height: double.maxFinite,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarGlow(
                  glowCount: 2,
                  glowColor: Colors.purple,
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/3790/3790868.png",
                    height: 70,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Checking Authentication...",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                ),
                GetX<AuthController>(
                  builder: (controller) {
                    if (controller.isLoggedIn.value == null) {
                      return const CircularProgressIndicator();
                    }

                    if (controller.isLoggedIn.value == true) {
                      Future.delayed(Duration(seconds: 2), () {
                        Get.off(ProductsScreen());
                      });
                    }

                    if (controller.isLoggedIn.value == false) {
                      Future.delayed(Duration(seconds: 2), () {
                        Get.off(() => LoginPage());
                      });
                    }

                    return LoadingAnimationWidget.dotsTriangle(
                      color: Colors.purple,
                      size: 50,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
