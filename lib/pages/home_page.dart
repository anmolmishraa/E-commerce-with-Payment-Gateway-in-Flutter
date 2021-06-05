import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:shop/core/const.dart';
import 'package:shop/core/flutter_icons.dart';

import 'package:shop/pages/InviteFriends.dart';
import 'package:shop/models/shoe_model.dart';
import 'package:shop/pages/Orders.dart';
import 'package:shop/pages/Mycart.dart';
import 'package:shop/pages/WishList.dart';
import 'package:shop/pages/detail_page.dart';
import 'package:shop/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/Account.dart';
import 'package:shop/pages/Messages.dart';
import 'package:shop/pages/MyCoupons.dart';
import 'package:shop/pages/searchpage.dart';
import 'package:shop/pages/Store.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [HomePage(), Mycart(), Account()];
  List<ShoeModel> shoeList = ShoeModel.list;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        minimum: EdgeInsets.zero,
        maintainBottomViewPadding: false,
        child: Scaffold(
          drawer: Drawer(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    accountName: Text(
                      "Anmol Mishra",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    accountEmail: Text(
                      "anmolmishra@gmail.com",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1559629819-638a8f0a4303?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Ym95fGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80"),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ListTile(
                      leading: Icon(Icons.home_outlined),
                      title: Text(
                        "Home",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text(
                      "My Account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Account()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag_outlined),
                    title: Text(
                      'My Orders',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Orders()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag_outlined),
                    title: Text(
                      "My Cart",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mycart()),
                      );
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list_alt_outlined),
                    title: Text(
                      "Wish List ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WishList()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.store_outlined),
                    title: Text(
                      "Favarite Store",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Store()),
                      );
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(
                      "Notification",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Messages()),
                      );
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text(
                      "Invite Friends",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InviteFriends()),
                      );
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.card_giftcard),
                    title: Text(
                      "My Coupons",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyCoupons()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onTap: () {
                      exit(0);
                    },
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            actions: [
              Stack(children: [
                IconButton(
                    icon: Icon(CupertinoIcons.bell),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Messages()));
                    }),
                Positioned(
                    top: 12.0,
                    bottom: 20.0,
                    left: 20.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.center,
                    ))
              ]),
            ],
            title: Center(
                child: Text(
              "Shopping",
              style: TextStyle(
                fontFamily: 'DancingScript',
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.green),
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    IconButton(
                      icon: Icon(FlutterIcons.search, color: Colors.black26),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => search()));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                margin: EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(
                  itemCount: shoeList.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailPage(
                              shoeList[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 230,
                        margin: EdgeInsets.only(right: 16),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: _buildBackground(index, 230),
                            ),
                            Positioned(
                              bottom: 130,
                              right: 10,
                              child: Hero(
                                tag: "hero${shoeList[index].imgPath}",
                                child: Transform.rotate(
                                  angle: -math.pi / 7,
                                  child: Image(
                                    width: 220,
                                    image: AssetImage(
                                        "assets/${shoeList[index].imgPath}"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "JUST FOR YOU",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "VIEW ALL",
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ...shoeList.map((data) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          data,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.red,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
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
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/${data.imgPath}"),
                          width: 100,
                          height: 60,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Text(
                                  "${data.name}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "${data.brand}",
                                style: TextStyle(
                                  color: Colors.black26,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "\₹${data.price.toInt()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyan.shade100,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.cyan.shade100,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_bag_outlined),
                        label: 'Shopping',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        label: 'Person',
                      ),
                    ],
                    selectedFontSize: 15,
                    unselectedFontSize: 10,
                    currentIndex: selectedPage,
                    unselectedItemColor: Colors.black,
                    selectedItemColor: Colors.deepOrangeAccent,
                    onTap: (index) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              _pageOptions[selectedPage])); // this has changed

                      setState(() {
                        selectedPage = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildBackground(int index, double width) {
    return ClipPath(
      clipper:
          AppClipper(cornerSize: 40, diagonalHeight: 0, roundedBottom: true),
      child: Container(
        color: shoeList[index].color,
        width: width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Icon(
                      shoeList[index].brand == "Nike"
                          ? FlutterIcons.nike
                          : FlutterIcons.converse,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: 125,
                    child: Text(
                      "${shoeList[index].name}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\₹${shoeList[index].price}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Icon(
                    FlutterIcons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
