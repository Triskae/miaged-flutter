import 'package:Miaged/common/models/cart.dart';
import 'package:Miaged/common/models/product.dart';

abstract class CartServiceAbstraction {
  Future<List<Product>> getUserCartContent();
  Future<Cart> addProductToCart(Product product);
  Future<Cart> removeProductFromCart(Product product);
}
