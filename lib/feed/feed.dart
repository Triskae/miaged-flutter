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
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: Center(
        child: Container(
          child: FeedList()
        ),
      ),
    );
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
