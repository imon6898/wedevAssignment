import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/controllers/auth_controller.dart';
import 'package:wedevsdssignment/services/cache/cache_manager.dart';

class ProfileController extends GetxController {
  String _profileImage = "assets/png/men_image.png"; // Default profile image URL

  String get profileImage => _profileImage;


  final AuthController _authController = Get.find<AuthController>();
  var isLoading = false.obs;


  var isAccountExpanded = false.obs;

  final emailProController = TextEditingController();
  final fullNameProController = TextEditingController();
  final streetAddressProController = TextEditingController();
  final aptSuiteProController = TextEditingController();
  final zipCodeProController = TextEditingController();

  void toggleAccountDetails() {
    isAccountExpanded.value = !isAccountExpanded.value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchAccountDetails();
  }


  Future<void> fetchAccountDetails() async {
    try {
      isLoading.value = true;
      var accountData = await _authController.account();
      if (accountData != null) {
        emailProController.text = accountData['email'] ?? '';
        fullNameProController.text = accountData['name'] ?? '';
        streetAddressProController.text = accountData['streetAddress'] ?? '';
        aptSuiteProController.text = accountData['aptSuite'] ?? '';
        zipCodeProController.text = accountData['zipCode'] ?? '';
      }
    } finally {
      isLoading.value = false;
    }
  }


  void logout() {
    _authController.logout();
  }

  // Future<void> updateProfile(String newFirstName, String newLastName) async {
  //   isLoading.value = true;
  //   try {
  //     String? token = await _authController.getToken();
  //     if (token == null) {
  //       Get.snackbar("Error", "User not authenticated");
  //       return;
  //     }
  //
  //     final response = await http.post(
  //       Uri.parse('http://apptest.dokandemo.com/wp-json/wp/v2/users/me'),
  //       headers: {
  //         'Authorization': CacheManager.token,
  //         'Content-Type': 'application/json'
  //       },
  //       body: jsonEncode({
  //         'first_name': newFirstName,
  //         'last_name': newLastName,
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       Get.snackbar("Success", "Profile updated successfully");
  //     } else {
  //       Get.snackbar("Error", "Failed to update profile");
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
