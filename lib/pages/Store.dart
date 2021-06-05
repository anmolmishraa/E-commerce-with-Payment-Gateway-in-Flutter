import 'package:flutter/material.dart';
class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
