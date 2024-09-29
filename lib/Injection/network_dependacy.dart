import 'package:ecom2/controllers/connection_controller.dart';
import 'package:get/get.dart';

class NetworkDependacy {
  static void init() {
    Get.put(ConnectionController(), permanent: true);
  }
}
