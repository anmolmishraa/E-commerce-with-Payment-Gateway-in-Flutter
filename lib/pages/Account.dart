import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),

          title: Text(
            "Profile",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.green),
        ),
        body: profileView());
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1559629819-638a8f0a4303?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Ym95fGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: IconButton(
                      icon:  Icon(Icons.add_a_photo_outlined),
                      onPressed: (){print("add pic");},
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.cyan.shade100, Colors.cyan.shade100])),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Anmol Mishra',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          width: 1.0, color: Colors.deepOrangeAccent.shade200)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'anmolmishra@gmail.com',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          width: 1.0, color: Colors.deepOrangeAccent.shade200)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            'Devnandan Mega Mall, 330, 334, Ashram Rd, opp. Sanyas Ashram, Ellisbridge, Ahmedabad, Gujarat 380006',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          width: 1.0, color: Colors.deepOrangeAccent.shade200)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '+91 1234567891',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          width: 1.0, color: Colors.deepOrangeAccent.shade100)),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child:Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 70,
                        width: 200,
                        child: Align(
                            child: TextButton(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                onPressed: () {
                                  print('Pressed');
                                })),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange.shade100,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                            )),
                      ),
                    ), ),
                    Expanded(
                      flex: 2,
                      child:
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:70,
                        width: 200,
                        child: Align(
                            child: TextButton(
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                onPressed: () {
                                  print('Pressed');
                                })),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange.shade100,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                            )),
                      ),
                    ),
                    )],
                ),

              )

            ],
          ),
        ))
      ],
    );
  }
}
