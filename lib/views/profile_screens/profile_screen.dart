import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "My Account",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 22.57,
                color: Color(0xFF222455),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Circle Image
                Center(
                  child: Container(
                    width: 122,
                    height: 122,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/png/men_image.png"), // Assuming you have a profileImage field in your ProfileController
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16), // Spacer

                // Name
                Text(
                  "John Smith",
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8), // Spacer

                // Email
                Text(
                  "info@johnsmith.com",
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xFF535353),
                  ),
                ),

                // New Container with list of rows
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildListRow("assets/svg/person.svg", "Account"),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Divider(height: 2,color: Color(0xffA0A9BD),),
                          ),
                          _buildListRow("assets/svg/password-icon.svg", "Password"),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Divider(height: 2,color: Color(0xffA0A9BD),),
                          ),
                          _buildListRow("assets/svg/notification_icon.svg", "Notification"),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Divider(height: 2,color: Color(0xffA0A9BD),),
                          ),
                          _buildListRow("assets/svg/heart.svg", "Wishlist"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListRow(String svgPath, String label) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                svgPath,
                height: 24,
                width: 24,
              ),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 17.36,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
