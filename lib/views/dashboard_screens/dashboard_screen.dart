import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: SafeArea(
        child: Obx(
              () => Center(
            child: DashboardController.widgetOptions[controller.selectedIndex.value],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
            () => ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomAppBar(
            height: 60,
            elevation: 4,
            shadowColor: Colors.grey,
            surfaceTintColor: Colors.white,
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 5.1,
            clipBehavior: Clip.antiAlias,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.onItemTapped(0);
                  },
                  child: SvgPicture.asset(
                    'assets/svg/home_icon.svg',
                    height: 24,
                    width: 24,
                    color: controller.selectedIndex.value == 0 ? Colors.red : Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.onItemTapped(1);
                  },
                  child: SvgPicture.asset(
                    'assets/svg/category_icon.svg',
                    height: 24,
                    width: 24,
                    color: controller.selectedIndex.value == 1 ? Colors.red : Colors.black,
                  ),
                ),
                SizedBox(width: 24), // To create space for the floating action button
                InkWell(
                  onTap: () {
                    controller.onItemTapped(3);
                  },
                  child: SvgPicture.asset(
                    'assets/svg/cart_icon.svg',
                    height: 24,
                    width: 24,
                    color: controller.selectedIndex.value == 3 ? Colors.red : Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.onItemTapped(4);
                  },
                  child: SvgPicture.asset(
                    'assets/svg/person.svg',
                    height: 24,
                    width: 24,
                    color: controller.selectedIndex.value == 4 ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
          hoverElevation: 10,
          splashColor: Colors.grey,
          backgroundColor: Colors.red,
          tooltip: 'Search',
          elevation: 4,
          child: Icon(Icons.search),
          onPressed: () => setState(() {
            controller.onItemTapped(2);
          }),
        ),
      ),
    );
  }
}
