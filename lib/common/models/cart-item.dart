import 'package:Miaged/common/models/product.dart';

class CartItem {
  final int quantity;
  final Product product;

  CartItem({this.quantity, this.product});

  factory CartItem.fromJson(dynamic json) {
    return CartItem(quantity: json['quantity'], product: Product.fromJson(json));
  }

  Map toJson() {
    return {
      'quantity': this.quantity,
      'product': this.product.toJson()
    };
  }

}
