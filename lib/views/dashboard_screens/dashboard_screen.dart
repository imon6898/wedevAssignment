import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            child: Obx(
                  () => Center(
                child: DashboardController.widgetOptions[controller.selectedIndex.value],
              ),
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomAppBar(
              height: 60,
              elevation: 0,
              shadowColor: Colors.black,
              surfaceTintColor: Colors.white,
              color: Colors.white,
              shape: CircularNotchedRectangle(),
              notchMargin: 0.1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
              backgroundColor: Colors.red,
              tooltip: 'Search',
              elevation: 4,
              child: Icon(Icons.search),
              onPressed: () {
                controller.onItemTapped(2);
              },
            ),
          ),
        );
      },
    );
  }
}




/*bottomNavigationBar: Obx(
            () => ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
            height: 60,
            elevation: 4,
            shadowColor: Colors.grey,
            surfaceTintColor: Colors.white,
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 0.1,
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
          //splashColor: Colors.grey,
          backgroundColor: Colors.red,
          tooltip: 'Search',
          elevation: 4,
          child: Icon(Icons.search),
          onPressed: () => setState(() {
            controller.onItemTapped(2);
          }),
        ),
      ),*/
