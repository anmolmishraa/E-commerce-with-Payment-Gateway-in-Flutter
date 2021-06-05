

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
             padding: const EdgeInsets.only(left: 5,right: 5,),
             child: FlipCard(
              direction: FlipDirection.VERTICAL, // default
              front: Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*.15,

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.cyan.shade100,
                  elevation: 5,
                  child: Text(
                    'Notification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              back: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.20,
                child: Card(
                  elevation: 5,
                  color: Colors.cyan.shade100,

                  child: Text(
                    'Skybags, Safari, Lavie... Upto 70%+Extra5%Off. Upto 70% off. BoAt,Intex & More. Tops, Dresses, Bra, Nighties. From ₹149+Extra10%Off. Makeup Bestsellers. From ₹99+5% Extra Off. Flasks & Bottles. From ₹299. Sparx, Asian.. From 199. Trimmers, Dryers & more. From ₹449. Home Temples, Swings & Ottomans. From ₹349.',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                ),
              ),
          ),
           ),

          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*.15,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.cyan.shade100,
                  elevation: 5,
                  child: Text(
                    'Notification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              back: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.20,
                child: Card(
                  elevation: 5,
                  color: Colors.cyan.shade100,

                  child: Text(
                    'Skybags, Safari, Lavie... Upto 70%+Extra5%Off. Upto 70% off. BoAt,Intex & More. Tops, Dresses, Bra, Nighties. From ₹149+Extra10%Off. Makeup Bestsellers. From ₹99+5% Extra Off. Flasks & Bottles. From ₹299. Sparx, Asian.. From 199. Trimmers, Dryers & more. From ₹449. Home Temples, Swings & Ottomans. From ₹349.',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                ),
              ),
            ),),

                   ],
          
          

        ),
    
    
    );
  }
}
