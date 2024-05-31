
import 'package:get/get.dart';
import 'package:wedevsdssignment/services/auth_service.dart';

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
    // Implement your login logic here
  }

  Future<void> register(String username, String email, String password) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      String token = 'your_generated_token_here';
      await setToken(token);
      Get.offNamed('/login');
    } catch (e) {
      print('Registration failed: $e');
    }
  }
}
