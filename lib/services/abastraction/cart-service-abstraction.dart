import 'package:Miaged/common/models/cart.dart';

abstract class CartServiceAbstraction {
  Future<Cart> getUserCart();
}
