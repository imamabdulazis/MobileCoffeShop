import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/data/models/request/order_body.dart';
import 'package:caffeshop/presentations/screens/payment/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class SumaryOrder extends StatefulWidget {
  final String drinkId;
  final String name;
  final String imageUrl;
  final int price;
  final int qty;
  final String categoryName;

  const SumaryOrder({
    Key key,
    @required this.drinkId,
    @required this.name,
    @required this.imageUrl,
    @required this.price,
    @required this.qty,
    @required this.categoryName,
  }) : super(key: key);
  @override
  _SumaryOrderState createState() => _SumaryOrderState();
}

class _SumaryOrderState extends State<SumaryOrder> {
  bool isLoading = true;
  final prefs = SharedPreferencesManager();

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
          padding: const EdgeInsets.all(15.0),
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.categoryName,
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
                                  "Rp ${f.format(widget.price)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Qty :${widget.qty}",
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
              ),
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
              title: "Total Belanja ${widget.qty} item",
              price: "Rp ${f.format(widget.price * widget.qty)}",
            ),
            const SizedBox(height: 5),
            _buildPembayarnLine(
              title: "Harga Satuan",
              price: "Rp ${f.format(widget.price)}",
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
              price: "Rp ${f.format(widget.price * widget.qty + 4000)}",
            ),
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
        color: CupertinoColors.lightBackgroundGray,
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
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Rp ${f.format(widget.price * widget.qty + 4000)}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(PaymentScreen(
                    orderBody: OrderBody(
                      amount: widget.qty,
                      discount: 0,
                      drinkId: widget.drinkId,
                      orderStatus: "Pending",
                      paymentMethodId: "-",
                      total: widget.price * widget.qty + 4000,
                      paymentStatus: "Pending",
                      userId:
                          prefs.getString(SharedPreferencesManager.keyIdUser),
                    ),
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
}
