import 'dart:convert';

import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/services/abastraction/feed-service-abstraction.dart';
import 'package:http/http.dart' as http;

class FeedService extends FeedServiceAbstraction {
  @override
  Future<List<Product>> getAllProducts() async {
    final response = await http.get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      var rawProducts = json.decode(response.body) as List;
      return rawProducts.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  @override
  Future<List<Product>> getAllProductsByCategory(String category) async {
    final response = await http.get('https://fakestoreapi.com/products/category/${Uri.encodeFull(category)}');
    if (response.statusCode == 200) {
      var rawProducts = json.decode(response.body) as List;
      return rawProducts.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  @override
  Future<Product> getProduct(int id) async {
    final response = await http.get('https://fakestoreapi.com/products/$id');
    var decodedResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      if (decodedResponse != null) {
        return Product.fromJson(decodedResponse);
      } else {
        return null;
      }
    } else {
      throw Exception("Failed to load products");
    }
  }

}