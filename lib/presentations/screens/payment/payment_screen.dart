import 'package:flutrans/flutrans.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isMakePayment = false;
  final flutrans = Flutrans();

  @override
  void initState() {
    flutrans.init("SB-Mid-client-SAKkWSOa7I8kzyCa", "SB-Mid-server-GxIuhd_WKHm_GYoIx99pmUr3");
    flutrans.setFinishCallback(_callback);
    super.initState();
  }

  Future<void> _callback(TransactionFinished finished) async {
    setState(() {
      isMakePayment = false;
    });
    return Future.value(null);
  }

  void makePayment() {
    setState(() {
      isMakePayment = true;
    });
    flutrans
        .makePayment(
          MidtransTransaction(
              7500,
              MidtransCustomer(
                  "Apin", "Prastya", "apin.klas@gmail.com", "085235419949"),
              [
                MidtransItem(
                  "5c18ea1256f67560cb6a00cdde3c3c7a81026c29",
                  7500,
                  2,
                  "USB FlashDisk",
                )
              ],
              skipCustomer: true,
              customField1: "ANYCUSTOMFIELD"),
        )
        .catchError((err) => print("ERROR $err"));
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
          child: isMakePayment
              ? CircularProgressIndicator()
              : ElevatedButton(
                  child: Text("Make Payment"),
                  onPressed: makePayment,
                ),
        ),
      ),
    );
  }
}
