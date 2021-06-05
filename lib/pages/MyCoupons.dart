import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';

class MyCoupons extends StatefulWidget {
  @override
  _MyCouponsState createState() => _MyCouponsState();
}

class _MyCouponsState extends State<MyCoupons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.shade100,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Image.asset("2.jpg"),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 405, left: 50, right: 50),

              child: FlipCard(
                direction: FlipDirection.VERTICAL, // default
                front:  Container(
                  height: MediaQuery.of(context).size.height,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade100,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Redeem',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                  ),
                ),
                back: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 400,

                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade100,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: TextButton(
                    child: SelectableText('FFESPORTS3MU',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                        onPressed: (){print("FFESPORTS3MU");},
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
