import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/views/cart_screens/cart_controller.dart';


class CartScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) {
        return Scaffold(

          body: Center(
            child: Text("Cart Screen"),
          ),

        );
      },
    );
  }
}