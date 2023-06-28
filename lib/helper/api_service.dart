import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:infoware/models/product_details.dart';
import 'dart:convert';

import 'package:infoware/models/products.dart';


class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com'; 

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      log(jsonData.toString());
      return jsonData.map((item) => Product(
        id: item['id'],
        name: item['title'],
        imageUrl: item['image'],
      )).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  static Future<ProductDetails> fetchProductDetails(int productId) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$productId'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProductDetails(
        id: jsonData['id'],
        description: jsonData['description'],
        price: jsonData['price'],
        image: jsonData['image'],
        tital: jsonData['title'],
        category: jsonData['category']
      );
    } else {
      throw Exception('Failed to fetch product details');
    }
  }
}
