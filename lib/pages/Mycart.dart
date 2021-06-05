import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:shop/models/shoe_model.dart';

typedef void CountButtonClickCallBack(int count);

class Mycart extends StatefulWidget {
  @override
  _MycartState createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  static const platform = const MethodChannel("razorpay_flutter");
  Razorpay _razorpay;
  static int subtotal=4000;
  var razsubtotal;
  List<ShoeModel> shoeList1 = ShoeModel.list;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              "My Cart",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 250),
              child: Container(
                height: MediaQuery.of(context).size.height*.5,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade100,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("1.png"),
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
                              "Nike",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CountButtonView(
                      initialCount: 1,
                      onChange: (count) {
                        setState(() {

                          subtotal = count * 4000;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "\₹ 4000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 100, right: 150),
                child: Text(
                  "Sub Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: AutoSizeText(
                    "\₹$subtotal",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    maxLines: 3,
                  ))


            ],
          ),
          ElevatedButton(

              child:
                  Text("Pay Now".toUpperCase(), style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)))),
              onPressed: openCheckout,



              )
        ],
      ),
    ));
  }
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }


  void openCheckout() async {
    setState(() {
      razsubtotal=subtotal*100;
    });

    var options = {
      'key': 'rzp_test_w8fT2F5cGc6qYT',
      'amount': "$razsubtotal",
      'name': '',
      "offer_id":"offer_H13u9rYfak9Nns",
      "currency":"INR",
      "status":"created",
      'description': "Nike_shoes",
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']

      }

    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }

  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
}



class CountButtonView extends StatefulWidget {
  final int initialCount;
  final CountButtonClickCallBack onChange;
  CountButtonView({this.initialCount, this.onChange});
  @override
  _CountButtonViewState createState() => _CountButtonViewState();
}

class _CountButtonViewState extends State<CountButtonView> {
  int count;
  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateCount(int addValue) {
    if (count + addValue >= 1) {
      setState(() {
        count += addValue;
      });
      if (widget.onChange != null) {
        widget.onChange(count);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0,
      height: 25.0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xddFFFFFF),
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    updateCount(-1);
                  },
                  child: Container(
                      width: 20.0,
                      child: Center(
                          child: Text(
                        '-',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      )))),
              Container(
                child: Center(
                    child: Text(
                  '$count',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                )),
              ),
              GestureDetector(
                  onTap: () {
                    updateCount(1);
                  },
                  child: Container(
                      width: 20.0,
                      child: Center(
                          child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      )))),
            ],
          ),
        ),
      ),
    );
  }
}
