import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/views/cart_screens/cart_screen.dart';
import 'package:wedevsdssignment/views/category_screens/category_screen.dart';
import 'package:wedevsdssignment/views/home_screens/home_screen.dart';
import 'package:wedevsdssignment/views/profile_screens/profile_screen.dart';
import 'package:wedevsdssignment/views/search_screens/search_screen.dart';


class DashboardController extends GetxController {
  var selectedIndex = 2.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  static List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
}

