import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/services/abastraction/cart-service-abstraction.dart';
import 'package:flutter/material.dart';

import '../service-locator.dart';

class FeedTile extends StatelessWidget {
  final Product product;
  final CartServiceAbstraction _cartService = locator<CartServiceAbstraction>();

  FeedTile({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, '/detail', arguments: {'product': this.product})},
      child: Card(
          child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: Image.network(this.product.image),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Text(
                    this.product.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.product.category.toUpperCase(),
                    style: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.product.price.toString() + " " + "€",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: _handleAddToCartButton,
            ),
          )
        ],
      )),
    );
  }

  void _handleAddToCartButton() {
    print("pressed");
    _cartService.addProductToCart(this.product);
  }
}
