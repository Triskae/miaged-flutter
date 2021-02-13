import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.store),
              activeIcon: Icon(Icons.store_outlined),
              label: "Acheter"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              activeIcon: Icon(Icons.shopping_cart_outlined),
              label: "Panier"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person_outline),
              label: "Profil"),
        ],
      ),
      body: Center(
        child: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return Text('coucou');
            },
          ),
        ),
      ),
    );
  }


  List<Widget> _getProducts() {
    return null;
  }
}
