import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecom2/productmodule/views/screens/home_screen.dart';
import 'package:ecom2/authmodule/views/screens/login_page.dart';
import 'package:ecom2/networkmodule/views/no_internet_connection_page.dart';
import 'package:ecom2/authmodule/views/screens/onboarding_screen.dart';
import 'package:get/get.dart';

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
      // Get.off(const NoInternetConnectionPage());
      Get.to(const NoInternetConnectionPage());
    } else {
      Get.offAll(OnboardingScreen());
    }
  }
}
