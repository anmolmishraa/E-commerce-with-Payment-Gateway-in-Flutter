import 'package:flutter/material.dart';
class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [


          ],

        ));
  }
}

