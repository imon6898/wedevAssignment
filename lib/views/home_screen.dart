import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';


class HomeScreen extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _productController.filterProducts('query'); // Replace 'query' with actual query.
            },
          ),
        ],
      ),
      body: Obx(() {
        if (_productController.products.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: _productController.products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_productController.products[index].name),
              subtitle: Text(_productController.products[index].description),
            );
          },
        );
      }),
    );
  }
}
