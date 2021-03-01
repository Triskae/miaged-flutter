import 'package:Miaged/basket/cart-tile.dart';
import 'package:Miaged/common/custom-appbar.dart';
import 'package:Miaged/common/models/cart.dart';
import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/service-locator.dart';
import 'package:Miaged/services/abastraction/cart-service-abstraction.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<List<Product>> cart;
  CartServiceAbstraction _cartService = locator<CartServiceAbstraction>();

  double totalOrder(List<Product> cartItems) {
    double total = 0;
    cartItems.forEach((item) => {
      total += item.price
    });
    return total;
  }

  Future<void> fetchCart() async {
    setState(() {
      cart = _cartService.getUserCartContent();
    });
  }

  @override
  void initState() {
    super.initState();
    cart = _cartService.getUserCartContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Panier",),
        body: FutureBuilder<List<Product>>(
      future: cart,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) {
                  return CartTile(product: snapshot.data[index], onDelete: () async {
                    print(index);
                    await _cartService.removeProductFromCart(snapshot.data[index]);
                    fetchCart();
                  });
                },
              ),
              Positioned(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text(
                          totalOrder(snapshot.data).toStringAsFixed(2) + ' €',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: 0,
                left: 0,
                right: 0,
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
