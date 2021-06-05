import 'package:shop/core/const.dart';
import 'package:shop/core/flutter_icons.dart';
import 'package:shop/models/shoe_model.dart';
import 'package:shop/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/Mycart.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  List<ShoeModel> shoeList1 = ShoeModel.list;
  final ShoeModel shoeModel;
  DetailPage(this.shoeModel);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
        backgroundColor: widget.shoeModel.color,
        elevation: 0,
        title: Text("CATEGORIES"),
        leading: IconButton(
          icon: Icon(FlutterIcons.left_open_1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .75,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(
                    cornerSize: MediaQuery.of(context).size.aspectRatio,
                    diagonalHeight: 150,
                    roundedBottom: false,
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                      top: 130,
                      left: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 400,
                          child: Text(
                            "${widget.shoeModel.name}",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "DETAILS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${widget.shoeModel.desc}",
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "COLOR OPTIONS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 30),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      print("blue color");
                                    },
                                    child:
                                        _buildColorOption(AppColors.blueColor)),
                                TextButton(
                                  onPressed: () {
                                    print("green Color");
                                  },
                                  child:
                                      _buildColorOption(AppColors.greenColor),
                                ),
                                TextButton(
                                  onPressed: () {
                                    print("orange Color");
                                  },
                                  child:
                                      _buildColorOption(AppColors.orangeColor),
                                ),
                                TextButton(
                                  onPressed: () {
                                    print("red Color");
                                  },
                                  child: _buildColorOption(AppColors.redColor),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: _buildBottom(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Hero(
                tag: "hero${widget.shoeModel.imgPath}",
                child: Transform.rotate(
                  angle: -math.pi / 7,
                  child: Image(
                    width: MediaQuery.of(context).size.width * .85,
                    height: MediaQuery.of(context).size.height * .25,
                    image: AssetImage("assets/${widget.shoeModel.imgPath}"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "PRICE",
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              Text(
                "\₹${widget.shoeModel.price.toInt()}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mycart()),
                  );
                  print("Add cart");
                },
                child: Text('Add Cart'),
              )),
        ],
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }
}
