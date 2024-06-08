import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/views/home_screens/home_controller.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(

          body: Center(
            child: Text("Home Screen"),
          ),

        );
      },
    );
  }
}
