import 'package:Miaged/basket/cart-screen.dart';
import 'package:Miaged/feed/feed.dart';
import 'package:Miaged/profil/profil.dart';
import 'package:flutter/material.dart';

class MainFrame extends StatefulWidget {
  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  int selectedIndex = 0;
  List<Widget> _widgetList = <Widget>[
    Feed(),
    CartScreen(),
    Profil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _handleBottomBarClick,
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
            child: _widgetList.elementAt(selectedIndex)
        ),
      ),
    );
  }

  void _handleBottomBarClick(int i) {
    setState(() {
      selectedIndex = i;
    });
  }
}
