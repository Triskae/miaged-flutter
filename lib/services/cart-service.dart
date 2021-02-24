import 'dart:convert';

import 'package:Miaged/common/models/cart.dart';
import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/services/abastraction/cart-service-abstraction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String UID = "UID";
final String EMAIL = "EMAIL";
final String CARTS = "carts";

class CartService extends CartServiceAbstraction {
  String storedUid;

  @override
  Future<Cart> getUserCart() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User user = FirebaseAuth.instance.currentUser;
    try {
      storedUid = user.uid;
      CollectionReference carts = firestore.collection(CARTS);
      carts
          .where('userId', isEqualTo: storedUid)
          .get()
          .then((QuerySnapshot value) => print(value.docs[0].data()['userId']))
          .catchError(
              (error) => print("Failed to get cart for this reason: $error"));
    } catch (e) {
      return Cart(userId: storedUid, cart: null);
    }
  }

  @override
  Future<void> addProductToCart(Product product) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User user = FirebaseAuth.instance.currentUser;
    try {
      storedUid = user.uid;
      CollectionReference carts = firestore.collection(CARTS);
      QuerySnapshot value = await carts.where('userId', isEqualTo: storedUid).get();
      if(value.docs.length != 0) {
        // Update an existing
        print('update');
        String ref = value.docs[0].id;
        String userId = value.docs[0].data()['userId'];
        var rawCart = jsonDecode(value.docs[0].data()['cart']);

        dynamic products = rawCart.map((e) => Product.fromJson(e)).toList();
        products.add(product);

        carts.doc(ref)
        .update({
          'cart': jsonEncode(products)
        });
      } else {
        // Add a cart
        print('add');
        Cart cart = new Cart(userId: storedUid, cart: new List());
        cart.cart.add(product);
        carts.add(cart.toMap());
      }
    } catch (e) {
      return Cart(userId: storedUid, cart: null);
    }
  }
}
