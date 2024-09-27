import 'package:ecom2/controllers/auth_controller.dart';
import 'package:ecom2/views/screens/home_screen.dart';
import 'package:ecom2/views/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 241, 240, 240),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 241, 240, 240)),
      home: authController.isLoggedIn.value ? ProductsScreen() : LoginPage(),
    );
  }
}
