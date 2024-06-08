import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/routes/app_routes.dart';
import 'package:wedevsdssignment/views/auth_screens/login_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {

    return GetBuilder<LoginController>(init: LoginController(), builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    SvgPicture.asset(
                      "assets/svg/dokan-logo.svg",
                      width: 165,
                      height: 50,
                    ),
                    SizedBox(height: 60),
                    Text(
                      "Sign In",
                      style: customTextStyle,
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      prefixIconPath: 'assets/svg/email-icon.svg',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      prefixIconPath: 'assets/svg/password-icon.svg',
                      suffixIcon: Icons.remove_red_eye_rounded,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFFA4A9AF),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'Login',
                        onPressed: () {

                          _authController.login(
                            controller.emailController.text,
                            controller.passwordController.text,
                          );
                        },
                        color: Color(0xFFF75F55),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add functionality for the white button
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: Colors.black.withOpacity(0.1),
                            elevation: 5,
                          ),
                          child: SvgPicture.asset(
                            "assets/svg/facebook.svg",
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: Colors.black.withOpacity(0.1),
                            elevation: 5,
                          ),
                          child: SvgPicture.asset(
                            "assets/svg/google_icon.svg",
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: (){ Get.toNamed(AppRoutes.registerScreen);},
                      child: Text("Create New Account"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
