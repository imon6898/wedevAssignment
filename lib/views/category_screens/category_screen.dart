import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_controller.dart'; // Make sure to import the controller

class CategoryScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) {
        return const Scaffold(

          body: Center(
            child: Text("Category Screen"),
          ),

        );
      },
    );
  }
}
