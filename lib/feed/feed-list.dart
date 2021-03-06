import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/service-locator.dart';
import 'package:Miaged/services/abastraction/feed-service-abstraction.dart';
import 'package:flutter/material.dart';

import 'feed-tile.dart';

class FeedList extends StatefulWidget {
  FeedList({Key key, this.category}) : super(key: key);
  final String category;

  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  Future<List<Product>> products;
  FeedServiceAbstraction _feedService = locator<FeedServiceAbstraction>();

  @override
  void initState() {
    super.initState();
    if (this.widget.category != null) {
      products = _feedService.getAllProducts(this.widget.category);
    } else {
      products = _feedService.getAllProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                return FeedTile(product: snapshot.data[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          }
          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
