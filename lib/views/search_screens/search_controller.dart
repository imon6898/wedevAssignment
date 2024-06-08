import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/utils/main_utils.dart';
import 'package:wedevsdssignment/widgets/custom_button.dart';
import 'package:wedevsdssignment/widgets/custom_checkbox.dart';

class MySearchController extends GetxController {
  // Define boolean variables to track the state of each checkbox
  var newestChecked = false.obs;
  var oldestChecked = false.obs;
  var priceLowToHighChecked = false.obs;
  var priceHighToLowChecked = false.obs;
  var bestSellingChecked = false.obs;

  List<Map<String, dynamic>> products = [];

  void toggleNewest() => newestChecked.toggle();
  void toggleOldest() => oldestChecked.toggle();
  void togglePriceLowToHigh() => priceLowToHighChecked.toggle();
  void togglePriceHighToLow() => priceHighToLowChecked.toggle();
  void toggleBestSelling() => bestSellingChecked.toggle();


  Future<void> loadData() async {
    try {
      dynamic jsonData = await MainUtils.loadJsonFromAssets('assets/json/response.json');

      if (jsonData is Map<String, dynamic>) {
        print('Loaded JSON data as Map: $jsonData');
      } else if (jsonData is List<dynamic>) {
        print('Loaded JSON data as List: $jsonData');
      } else {
        print('Unexpected JSON data format: $jsonData');
      }
    } catch (e) {
      print("Error loading JSON data: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }







  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          color: Color(0xFFF8F8F8),
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: 47,
                        height: 3,
                        color: Color(0xFFFFD3DD),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Filter",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 17.36,
                            height: 20.35 / 17.36,
                            letterSpacing: 0.16,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(() => CustomCheckboxRow(
                          labelText: 'Newest',
                          isChecked: newestChecked.value,
                          onChanged: (value) {
                            toggleNewest();
                          },
                        )),
                        Obx(() => CustomCheckboxRow(
                          labelText: 'Oldest',
                          isChecked: oldestChecked.value,
                          onChanged: (value) {
                            toggleOldest();
                          },
                        )),
                        Obx(() => CustomCheckboxRow(
                          labelText: 'Price low > High',
                          isChecked: priceLowToHighChecked.value,
                          onChanged: (value) {
                            togglePriceLowToHigh();
                          },
                        )),
                        Obx(() => CustomCheckboxRow(
                          labelText: 'Price high > Low',
                          isChecked: priceHighToLowChecked.value,
                          onChanged: (value) {
                            togglePriceHighToLow();
                          },
                        )),
                        Obx(() => CustomCheckboxRow(
                          labelText: 'Best selling',
                          isChecked: bestSellingChecked.value,
                          onChanged: (value) {
                            toggleBestSelling();
                          },
                        )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 61,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        flex: 5,
                        child: CustomButton(
                          text: 'Cancel',
                          textColor: Colors.black,
                          onPressed: () {
                            Navigator.pop(context); // Close the bottom sheet
                          },
                          height: 60,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        flex: 5,
                        child: CustomButton(
                          text: 'Apply',
                          onPressed: () {
                            // Handle apply filter logic
                            Navigator.pop(context); // Close the bottom sheet
                          },
                          height: 60,
                          color: Color(0xFF1ABC9C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
