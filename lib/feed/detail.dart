import 'package:Miaged/common/custom-appbar.dart';
import 'package:Miaged/common/models/cart.dart';
import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/services/abastraction/cart-service-abstraction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service-locator.dart';

class Detail extends StatelessWidget {

  final CartServiceAbstraction _cartService = locator<CartServiceAbstraction>();
  final Product product;

  Detail({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    final Map arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: CustomAppBar(title: product.title),
      key: key,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, -1),
                  child: Image.network(
                    product.image,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 270, 0, 0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(6, 20, 6, 0),
                                child: Text(
                                  product.title,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  "Catégorie: " + product.category,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black45,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  "Marque: " + product.brand,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black45,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Text(
                                product.size,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Text(
                                  product.price.toString() + " €",
                                  style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: RatingBarIndicator(
                                rating: product.rating.toDouble(),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              )),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: RaisedButton.icon(
                                  onPressed: () async {
                                    Cart cart = await _cartService.addProductToCart(product);
                                    final snackBar = SnackBar(content: Text(cart.message != null ? cart.message : "Une erreur s'est produite"));
                                    key.currentState.showSnackBar(snackBar);
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
                              ),
                              Expanded(
                                  child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product.description,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
