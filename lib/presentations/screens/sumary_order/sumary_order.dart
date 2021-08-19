import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/data/models/request/new_order_body.dart';
import 'package:caffeshop/data/models/request/order_body.dart';
import 'package:caffeshop/presentations/screens/payment/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class SumaryOrder extends StatefulWidget {
  final NewOrderBody body;

  const SumaryOrder({
    Key key,
    this.body,
  }) : super(key: key);
  @override
  _SumaryOrderState createState() => _SumaryOrderState();
}

class _SumaryOrderState extends State<SumaryOrder> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                _buildContent(),
                _buildButtonBottom(),
              ],
            ),
    );
  }

  Widget _buildContent() {
    f.maximumFractionDigits = 0;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daftar Barang",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              Column(
                children: widget.body.drinks
                    .map(
                      (e) => _buildDrink(
                        name: e.name,
                        cat: e.cat,
                        image: e.image,
                        price: int.parse(e.price),
                        qty: e.quantity,
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
        Divider(
          color: CupertinoColors.extraLightBackgroundGray,
          height: 20,
          thickness: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Rincian Pembayaran",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            _buildPembayarnLine(
              title: "Total beli ${widget.body.drinks.length} item",
              price: "Rp ${f.format(widget.body.total-4000)}",
            ),
            const SizedBox(height: 5),
            _buildPembayarnLine(
              title: "Biaya Transaksi",
              price: "Rp ${f.format(4000)}",
            ),
            const SizedBox(height: 5),
            Divider(),
            const SizedBox(height: 5),
            _buildPembayarnLine(
              title: "Total Pembayaran",
              price: "Rp ${f.format(widget.body.total)}",
            ),
            const SizedBox(height: 90),
          ]),
        ),
      ],
    );
  }

  Widget _buildPembayarnLine({String title, String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _buildButtonBottom() {
    f.maximumFractionDigits = 0;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: CupertinoColors.extraLightBackgroundGray,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total pembayaran",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Rp ${f.format(widget.body.total)}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(PaymentScreen(
                    newOrderBody: widget.body,
                  ));
                },
                child: Text(
                  "Pilih pembayaran",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrink({
    String name,
    String image,
    String cat,
    int price,
    int qty,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
              width: 60,
              height: 60,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              )),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontSize: 14,
                  ),
                ),
                Text(
                  cat,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp ${f.format(price)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Qty $qty",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
