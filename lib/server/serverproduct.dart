
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http package
import 'package:test1/constant.dart';
import 'package:test1/module/product.dart';

class AdminServices {
  Future<void> sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required String price,
    required String category,
    required String images,
  }) async {
    try {
      Product product = Product(
        name: name,
        description: description,
        images: images,
        category: category,
        price: price,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/add'), // Replace 'uri' with your actual API endpoint
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: product.toJson(),
      );

    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}
