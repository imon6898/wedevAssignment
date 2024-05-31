import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'auth_controller.dart';

class ProfileController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  var firstName = ''.obs;
  var lastName = ''.obs;
  var isLoading = false.obs;

  Future<void> updateProfile(String newFirstName, String newLastName) async {
    isLoading.value = true;
    try {
      String? token = await _authController.getToken();
      if (token == null) {
        Get.snackbar("Error", "User not authenticated");
        return;
      }

      final response = await http.post(
        Uri.parse('http://apptest.dokandemo.com/wp-json/wp/v2/users/me'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'first_name': newFirstName,
          'last_name': newLastName,
        }),
      );

      if (response.statusCode == 200) {
        firstName.value = newFirstName;
        lastName.value = newLastName;
        Get.snackbar("Success", "Profile updated successfully");
      } else {
        Get.snackbar("Error", "Failed to update profile");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
