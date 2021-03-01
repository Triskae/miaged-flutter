import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/services/abastraction/cart-service-abstraction.dart';
import 'package:flutter/material.dart';

import '../service-locator.dart';

class CartTile extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;
  CartTile({this.product, this.onDelete});

  CartServiceAbstraction _cartService = locator<CartServiceAbstraction>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                product.image,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    product.size,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    product.price.toString() + " €",
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: onDelete,
          )
        ],
      ),
    );
  }
}
