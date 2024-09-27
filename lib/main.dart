import 'package:ecom2/views/screens/home_screen.dart';
import 'package:ecom2/views/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const LoginPage(),
    );
  }
}
