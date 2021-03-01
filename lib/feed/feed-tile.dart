import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/feed/detail.dart';
import 'package:Miaged/services/abastraction/cart-service-abstraction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../service-locator.dart';

class FeedTile extends StatelessWidget {
  final Product product;

  FeedTile({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Detail(product: product,);
        }))
      },
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
                  padding: EdgeInsets.only(top: 20, left: 15),
                  child: Text(
                    this.product.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBarIndicator(
                    rating: this.product.rating.toDouble(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.product.size.toUpperCase(),
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
          )
        ],
      )),
    );
  }
}
