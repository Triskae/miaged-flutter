import 'package:Miaged/common/models/cart.dart';
import 'package:Miaged/common/models/product.dart';

abstract class CartServiceAbstraction {
  Future<Cart> getUserCart();
  Future<void> addProductToCart(Product product);
}
