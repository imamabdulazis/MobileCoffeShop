import 'package:caffeshop/data/models/request/order_kasir_body.dart';
import 'package:caffeshop/data/models/response/detail_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class Receipt extends StatelessWidget {
  const Receipt({Key key, this.detail}) : super(key: key);

  final DetailOrderModel detail;

  @override
  Widget build(BuildContext context) {
    f.maximumFractionDigits = 0;
    return Container(
      width: Get.width / 3,
      child: Column(
        children: [
          Text(
            "Copsychus Coffeeshop",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "Jl. Veteran No.38-28, Muja Muju, Kec. Umbulharjo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55165",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 3),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tanggal"),
                Text(DateFormat("dd, MMM yyyy").format(DateTime.now())),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: detail?.data?.orderItems?.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${detail.data.orderItems[index].quantity}x ${detail.data.orderItems[index].drink.name}"),
                    Text("Rp ${f.format(detail.data.orderItems[index].drink.price)}",),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Bayarr",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Rp ${f.format(detail.data.total)}",
                ),
              ],
            ),
          ),
          Divider(),
          Text(
            "Thank You",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Row(
      children: List.generate(
          150 ~/ 10,
          (index) => Expanded(
                child: Container(
                  color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                  height: 2,
                  width: 1,
                ),
              )),
    );
  }
}
