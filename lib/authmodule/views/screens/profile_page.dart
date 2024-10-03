import 'package:ecom2/authmodule/controller/auth_controller.dart';
import 'package:ecom2/authmodule/controller/package_info_controller.dart';
import 'package:ecom2/authmodule/views/screens/faq_section.dart';
import 'package:ecom2/authmodule/views/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';

import '../widgets/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final info = Get.put(PackageInfoController());

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
      body: Stack(
        children: [
          Opacity(
              opacity: 0.12,
              child: Image.asset(
                "assets/images/Bg_image.png",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              )),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  ProfilePic(
                    press: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Marquee(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            authController.box.read('currentUser')['name'],
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Marquee(
                          child: Row(children: [
                            const Icon(Icons.email_outlined,
                                color: Color.fromARGB(255, 152, 152, 152)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                authController.box.read('currentUser')['email'],
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 152, 152, 152))),
                          ]),
                        )
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 218, 218, 218)),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const ListTile(
                    leading: Icon(
                      Icons.shopping_bag,
                      color: Color.fromARGB(255, 248, 223, 4),
                      size: 30,
                    ),
                    title: Text(
                      "Orders",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_right_alt_outlined),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 218, 218, 218)),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    onTap: () {
                      Get.to(() => const FaqSection(),
                          transition: Transition.rightToLeft);
                    },
                    leading: const Icon(
                      Icons.chat_bubble_outline,
                      color: Color.fromARGB(255, 248, 223, 4),
                      size: 30,
                    ),
                    title: const Text(
                      "FAQs",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 218, 218, 218)),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const ListTile(
                    leading: Icon(
                      Icons.call,
                      color: Color.fromARGB(255, 248, 223, 4),
                      size: 30,
                    ),
                    title: Text(
                      "Support",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_right_alt_outlined),
                  ),
                ),
                Obx(() => Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Text(
                      "BuyIt |${info.packageVersion}",
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
