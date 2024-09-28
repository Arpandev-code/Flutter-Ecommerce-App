import 'package:ecom2/controllers/auth_controller.dart';
import 'package:ecom2/views/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authController.logout();
              Get.offAll(() => LoginPage());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Obx(() => Column(
              children: [
                ProfilePic(
                  press: () {},
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.man_outlined),
                  title: Text(authController.currentUser['name']),
                ),
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: Text(authController.currentUser['email']),
                ),
              ],
            )),
      ),
    );
  }
}
