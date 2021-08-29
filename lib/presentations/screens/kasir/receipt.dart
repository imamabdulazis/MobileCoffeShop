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
          _divider(),
          ListTile(
              title: Text("Tanggal"),
              trailing:
                  Text(DateFormat("dd, MMM yyyy").format(DateTime.now()))),
          _divider(),
          Expanded(
            child: ListView.builder(
              itemCount: detail?.data?.orderItems?.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    "${detail.data.orderItems[index].quantity}x ${detail.data.orderItems[index].drink.name}"),
                trailing: Text("${detail.data.orderItems[index].drink.price}"),
              ),
            ),
          ),
          _divider(),
          ListTile(
            title: Text("Total Bayar"),
            trailing: Text(
              "Rp ${f.format(detail.data.total)}",
            ),
          ),
          _divider(),
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
                ),
              )),
    );
  }
}
