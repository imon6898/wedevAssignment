import 'package:get/get.dart';
import '../models/user.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();
  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      var fetchedProducts = await _productService.fetchProducts();
      products.value = fetchedProducts;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products');
    }
  }

  void filterProducts(String query) {
    var filtered = products.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
    products.value = filtered;
  }
}
