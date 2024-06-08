import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/controllers/auth_controller.dart';
import 'package:wedevsdssignment/routes/app_routes.dart';


class SplashScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // Delay the navigation to check authentication status
    Future.delayed(Duration(seconds: 3), () async {
      String? token = await _authController.getToken();
      if (token != null) {
        _authController.isAuthenticated.value = true;
        Get.offNamed(AppRoutes.homeScreen);
      } else {
        Get.offNamed(AppRoutes.loginScreen);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your app logo here
            //Image.asset('assets/logo.png', width: 150, height: 150),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
