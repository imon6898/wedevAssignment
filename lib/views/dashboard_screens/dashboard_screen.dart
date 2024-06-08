import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';
import 'package:wedevsdssignment/views/cart_screens/cart_screen.dart';
import 'package:wedevsdssignment/views/category_screens/category_screen.dart';
import 'package:wedevsdssignment/views/home_screens/home_screen.dart';
import 'package:wedevsdssignment/views/profile_screens/profile_screen.dart';
import 'package:wedevsdssignment/views/search_screens/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
        child: DashboardController.widgetOptions[controller.selectedIndex.value],
      )),
      bottomNavigationBar: Obx(
            () => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: Offset(0, -10),
                blurRadius: 14,
                spreadRadius: 10,
              ),
            ],
          ),
          child: CurvedNavigationBar(
            index: controller.selectedIndex.value,
            height: 50.0,
            items: <Widget>[
              SvgPicture.asset(
                'assets/svg/home_icon.svg',
                height: 24,
                width: 24,
                color: controller.selectedIndex.value == 0 ? Colors.white : Colors.black,
              ),
              SvgPicture.asset(
                'assets/svg/category_icon.svg',
                height: 24,
                width: 24,
                color: controller.selectedIndex.value == 1 ? Colors.white : Colors.black,
              ),
              SvgPicture.asset(
                'assets/svg/search_icon.svg',
                height: 24,
                width: 24,
                color: controller.selectedIndex.value == 2 ? Colors.white : Colors.black,
              ),
              SvgPicture.asset(
                'assets/svg/cart_icon.svg',
                height: 24,
                width: 24,
                color: controller.selectedIndex.value == 3 ? Colors.white : Colors.black,
              ),
              SvgPicture.asset(
                'assets/svg/person.svg',
                height: 24,
                width: 24,
                color: controller.selectedIndex.value == 4 ? Colors.white : Colors.black,
              ),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.red,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              controller.onItemTapped(index);
            },
          ),
        ),
      ),
    );
  }
}
