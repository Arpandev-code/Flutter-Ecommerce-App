import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecom2/views/screens/login_page.dart';
import 'package:ecom2/views/screens/no_internet_connection_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectionController extends GetxController {
  final connectivity = Connectivity();
  @override
  void onInit() {
    super.onInit();

    Connectivity().onConnectivityChanged.listen(checkConnection);
  }

  checkConnection(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.none)) {
      // Get.rawSnackbar(
      //   duration: const Duration(days: 1),
      //   isDismissible: false,
      //   messageText: Text(
      //     'No internet connection',
      //     style: GoogleFonts.roboto(
      //       color: Colors.white,
      //       fontSize: 18,
      //     ),
      //   ),
      //   backgroundColor: Colors.red,
      // );
      Get.off(const NoInternetConnectionPage());
    } else {
      Get.to(LoginPage());
    }
  }
}
