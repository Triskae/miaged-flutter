import 'package:Miaged/common/custom-appbar.dart';
import 'package:Miaged/common/models/product.dart';
import 'package:Miaged/feed/feed-list.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text("Boutique", style: TextStyle(color: Colors.black),),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              tabs: [
                Tab(
                  text: "Tout",
                ),
                Tab(
                  text: "Femme",
                ),
                Tab(
                  text: "Homme",
                ),
              ],
            ),
          ),
          body: Center(
            child: TabBarView(
              children: [
                Container(child: FeedList()),
                Container(child: FeedList(category: 'women clothing',)),
                Container(child: FeedList(category: 'men clothing',))
              ],
            ),
          ),
        ));
  }

  List<Widget> _getProducts() {
    return null;
  }

  void _handleBottomBarClick(int i) {
    setState(() {
      currentTab = i;
    });
  }
}
