import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final AuthController _authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    _authController.login(emailController.text, passwordController.text);
  }
}
