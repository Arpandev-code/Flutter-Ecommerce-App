import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../views/screens/home_screen.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  var isLoggedIn = false.obs;
  var users = [].obs;
  var currentUser = {}.obs;

  @override
  void onInit() {
    super.onInit();
    loadLoginStatus();
  }

  // Load login status
  void loadLoginStatus() {
    isLoggedIn.value = box.read('isLoggedIn') ?? false;
  }

  // Sign up a new user
  void signUp(String name, String email, String password) {
    List<dynamic> usersList = box.read('users') ?? [];
    var existingUser = usersList.firstWhere(
      (user) => user['email'] == email,
      orElse: () => null,
    );
    if (existingUser != null) {
      Get.snackbar("Error", "Email already exists!");
      return;
    }
    usersList.add({
      'name': name,
      'email': email,
      'password': password,
    });

    box.write('users', usersList);
    Get.snackbar("Success", "User registered successfully!");
  }

  // Log in user
  login(String email, String password) {
    List<dynamic> usersList = box.read('users') ?? [];
    var user = usersList.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => null,
    );

    if (user == null) {
      Get.snackbar("Error", "Invalid email or password!");
      return false;
    }

    isLoggedIn.value = true;
    currentUser.value = user;
    box.write('isLoggedIn', true);
    box.write('currentUser', user);
    Get.snackbar("Success", "Logged in successfully!");
    return true;
  }

  // Log out user
  void logout() {
    isLoggedIn.value = false;
    box.write('isLoggedIn', false);
    Get.snackbar("Success", "Logged out successfully!");
  }
}
