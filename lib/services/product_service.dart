import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../utils/api.dart';


class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(Api.products));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}