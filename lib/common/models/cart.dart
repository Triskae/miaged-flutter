import 'dart:convert';

import 'package:Miaged/common/models/product.dart';

class Cart {
  final String userId;
  final List<Product> cart;

  Cart({this.userId, this.cart});

  factory Cart.fromJson(dynamic json) {
    return Cart(userId: json['userId'], cart: json['products']);
  }

  @override
  String toString() {
    return 'Cart{userId: $userId, products: $cart}';
  }

  Map toJson() {
    List<Map> cart = this.cart != null ? this.cart.map((e) => e.toJson()).toList() : null;
    return {
      'userId': this.userId,
      "cart": cart
    };
  }

  Map toMap() {
    return {
      'userId': this.userId,
      'cart': jsonEncode(this.cart)
    };
  }
}
