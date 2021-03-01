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
  Future<List<Product>> getUserCartContent() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User user = FirebaseAuth.instance.currentUser;
    try {
      storedUid = user.uid;
      CollectionReference carts = firestore.collection(CARTS);
      QuerySnapshot value =
          await carts.where('userId', isEqualTo: storedUid).get();
      if (value.docs.length != 0) {
        var rawCart = jsonDecode(value.docs[0].data()['cart']);
        List<Product> products = new List();
        rawCart.forEach((p) => {products.add(Product.fromJson(p))});
        return products;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Cart> addProductToCart(Product product) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User user = FirebaseAuth.instance.currentUser;
    try {
      storedUid = user.uid;
      CollectionReference carts = firestore.collection(CARTS);
      QuerySnapshot value =
          await carts.where('userId', isEqualTo: storedUid).get();
      if (value.docs.length != 0) {
        String ref = value.docs[0].id;
        String userId = value.docs[0].data()['userId'];
        var rawCart = jsonDecode(value.docs[0].data()['cart']);

        dynamic products = rawCart.map((e) => Product.fromJson(e)).toList();
        if (products.every((p) => p.id != product.id)) {
          products.add(product);
          carts.doc(ref).update({'cart': jsonEncode(products)});
          return Cart(
              userId: storedUid,
              cart: products,
              message: "Ajouté au panier avec succès !");
        }
        return Cart(
            userId: storedUid,
            cart: products,
            message: "Ce produit a déjà été ajouté au panier !");
      }
    } catch (e) {
      return Cart(userId: storedUid, cart: null);
    }
  }

  @override
  Future<Cart> removeProductFromCart(Product product) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User user = FirebaseAuth.instance.currentUser;
    try {
      storedUid = user.uid;
      CollectionReference carts = firestore.collection(CARTS);
      QuerySnapshot value =
          await carts.where('userId', isEqualTo: storedUid).get();
      if (value.docs.length != 0) {
        String ref = value.docs[0].id;
        String userId = value.docs[0].data()['userId'];
        var rawCart = jsonDecode(value.docs[0].data()['cart']);

        dynamic products = rawCart.map((e) => Product.fromJson(e)).toList();

        int elemToRemove = products.indexWhere((p) {
          return p.id == product.id;
        });
        print("avant");
        print(products.length);
        products.removeAt(elemToRemove);
        print("après");
        print(products.length);
        carts.doc(ref).update({'cart': jsonEncode(products)});
      }
    } catch (e) {
      print(e);
      return Cart(userId: storedUid, cart: null);
    }
  }
}
