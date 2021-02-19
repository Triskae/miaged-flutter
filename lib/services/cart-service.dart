import 'package:Miaged/common/models/cart.dart';
import 'package:Miaged/services/abastraction/cart-service-abstraction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          .catchError((error) => print("Failed to get cart for this reason: $error"));

    } catch (e) {
      return Cart(userId: storedUid, cart: null);
    }
  }
}
