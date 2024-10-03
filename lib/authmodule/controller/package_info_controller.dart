import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoController extends GetxController {
  var packageVersion = "".obs;

  @override
  void onInit() {
    super.onInit();
    getPackageInfo();
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    packageVersion.value = packageInfo.version;
  }
}
