import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/routes/app_routes.dart';
import 'package:wedevsdssignment/views/auth_screens/registrasion_controller.dart';
import 'package:wedevsdssignment/widgets/custom_button.dart';
import 'package:wedevsdssignment/widgets/custom_text_field.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/circular_image_picker.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrasionController>(init: RegistrasionController(), builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 80.0,right: 16, left: 16),
              child: Column(
                children: [
                  CircularImagePicker(
                    imagePath: controller.selectedImagePath.value,
                    fallbackImagePath: 'assets/svg/person.svg', // Path to the fallback image
                    width: 121.53,
                    height: 121.53,
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    controller: controller.nameController,
                    hintText: 'Name',
                    prefixIconPath: 'assets/svg/person.svg',
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintText: 'Confirm Password',
                    prefixIconPath: 'assets/svg/password-icon.svg',
                    suffixIcon: Icons.remove_red_eye_rounded,
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Register',
                      onPressed: () {
                        _authController.register(
                          controller.nameController.text,
                          controller.emailController.text,
                          controller.passwordController.text,
                          controller.confirmPasswordController.text,
                        );
                      },
                      color: Color(0xFFF75F55),
                    ),
                  ),


                  SizedBox(height: 30,),
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


                  SizedBox(height: 30,),

                  GestureDetector(
                    onTap: (){ Get.toNamed(AppRoutes.loginScreen);},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        Text("Login", style: TextStyle(color: Color(0xff2893E3)),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
