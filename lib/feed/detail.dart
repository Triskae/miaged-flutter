import 'package:Miaged/common/models/product.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Product product;

  Detail({this.product});

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    Product product = arguments['product'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Image.network(
                      product.image,
                      width: 200,
                      height: 300,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 10, 10),
              child: Text(
                product.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                product.category,
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                product.price.toString() + ' €',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            ),
            RaisedButton.icon(
              onPressed: () {
                print('Button Clicked.');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              label: Text(
                'Ajouter au panier',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              color: Colors.blueAccent,
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
