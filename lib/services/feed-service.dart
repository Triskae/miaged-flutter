import 'dart:convert';

import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/services/abastraction/feed-service-abstraction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String PRODUCTS = "products";

class FeedService extends FeedServiceAbstraction {
  String storedUid;

  @override
  Future<List<Product>> getAllProducts() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      CollectionReference carts = firestore.collection(PRODUCTS);
      QuerySnapshot products = await carts.get();

      if (products.docs.length != 0) {
        List<Product> result = products.docs.map((e) => Product.fromJson(e.data())).toList();
        return result;
      }
    } catch (e) {
      throw Exception("Failed to load products");
    }
    return null;
  }

  @override
  Future<List<Product>> getAllProductsByCategory(String category) async {
    final response = await http.get(
        'https://fakestoreapi.com/products/category/${Uri.encodeFull(category)}');
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
