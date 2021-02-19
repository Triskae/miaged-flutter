import 'package:Miaged/common/models/product.dart';
import 'package:flutter/material.dart';

class FeedTile extends StatelessWidget {
  final Product product;

  FeedTile({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: <Widget>[
        Container(
          width: 100,
          child: Image.network(this.product.image),
        ),
        Column(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  child: Text(this.product.title),
                ))
          ],
        )
      ],
    ));
  }
}
