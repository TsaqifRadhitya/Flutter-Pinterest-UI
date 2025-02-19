import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_x/app/data/models/Product.dart';
import 'package:http/http.dart' as http;

class FakerApiProvider {
  final baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProduct() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception(response.body);
    }
  }
}
