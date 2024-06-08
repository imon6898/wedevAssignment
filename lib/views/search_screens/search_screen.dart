import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/widgets/custom_product_card.dart';
import 'search_controller.dart'; // Import the controller

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySearchController>(
      init: MySearchController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Remove back button icon
            title: Text(
              "Product List",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 22.57,
                color: Color(0xFF222455),
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, size: 30),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF395AB8).withOpacity(0.5), // shadow color
                        offset: Offset(0, 3), // x and y offsets
                        blurRadius: 4.0, // blur radius
                        spreadRadius: 0.0, // spread radius
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10), // optional, for rounded corners
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: (){
                            controller.bottomSheet(context);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/filter_icon.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Filter",
                                style: TextStyle(color: Colors.greenAccent, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              child: Row(
                                children: [
                                  Text(
                                    "Sort by ",
                                    style: TextStyle(color: Colors.greenAccent, fontSize: 18),
                                  ),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                    'assets/svg/arrow_down.svg',
                                    height: 10,
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/list_icon.svg',
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Example cross axis count
                        childAspectRatio: 0.6, // Adjust the aspect ratio to fit the product card
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,

                      ),
                      itemCount: controller.products.length, // Number of items in the grid
                      itemBuilder: (context, index) {
                        var product = controller.products[index];
                        return CustomProductCard(
                          image: product['file'] ?? '', // Adjust field names as per your JSON structure
                          productName: product['name'] ?? '',
                          discountPrice: product['regular_price'] ?? 0.0,
                          currentPrice: product['price'] ?? 0,
                          initialRating: product['rating_count'] ?? 0.0,
                        );
                      },
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
}
