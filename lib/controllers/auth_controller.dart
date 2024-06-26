
import 'dart:developer';

import 'package:get/get.dart';
import 'package:wedevsdssignment/routes/app_routes.dart';
import 'package:wedevsdssignment/services/auth_service.dart';
import 'package:wedevsdssignment/services/cache/cache_manager.dart';
import 'package:wedevsdssignment/services/network/http_requests.dart';
import 'package:wedevsdssignment/utils/main_utils.dart';

import '../utils/api.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  var isAuthenticated = false.obs;

  Future<String?> getToken() async {
    return await _authService.getToken();
  }

  Future<void> setToken(String token) async {
    await _authService.setToken(token);
    isAuthenticated.value = true;
  }

  Future<void> deleteToken() async {
    await _authService.deleteToken();
    isAuthenticated.value = false;
  }

  Future<void> login(String username, String password) async {
    try {
      //await Future.delayed(Duration(seconds: 2));
      String url = Api.login;
      var result = await HttpRequests.post(url, body: {

        "username": username,
        //"email": email,
        "password": password
      });

      if(result == null)
      {
        MainUtils.showErrorSnackBar("Something went wrong");
        return;
      }


      MainUtils.showSuccessSnackBar("Login successful");
      String token = result['token'];
      await CacheManager.setToken(token);
      await setToken(token);
      print("setToken = ${CacheManager.token}");
      Get.offNamed(AppRoutes.DashboardScreen);


      print("Login Result = ${result}");


      //Get.offNamed('/login');
    } catch (e) {
      print('Registration failed: $e');
    }
  }

  Future<void> register(String username, String email, String password, String confirmPassword) async {
    try {
      //await Future.delayed(Duration(seconds: 2));
      String url = Api.register;
      var result = await HttpRequests.post(url, body: {

          "username": username,
          "email": email,
          "password": password
      }, Enableencoding: true);

      if(result == null)
        {
          MainUtils.showErrorSnackBar("Something went wrong");
          return;
        }
      if(result["code"] != 200)
      {

        MainUtils.showErrorSnackBar("${result["message"]}");
        return;
      }

      MainUtils.showSuccessSnackBar("Registration successful");


      print("Register Result = ${result}");
      String token = 'your_generated_token_here';
      await setToken(token);
      Get.offNamed('/login');
    } catch (e) {
      print('Registration failed: $e');
    }
  }

  Future<Map<String, dynamic>?> account() async {
    try {
      String url = Api.getUserData;
      var token = await getToken();
      var result = await HttpRequests.get(url, headers: {
        'Authorization': 'Bearer $token',
      });

      if (result == null) {
        MainUtils.showErrorSnackBar("Something went wrong");
        return null;
      }

      print("Account Result = $result");
      return result as Map<String, dynamic>;
    } catch (e) {
      print('Fetching account details failed: $e');
      return null;
    }
  }


  Future<void> logout() async {
    await CacheManager.removeToken();
    isAuthenticated.value = false;
    Get.offAllNamed(AppRoutes.loginScreen); // Navigate to the login screen
  }
}
