import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/gopay_body.dart';
import 'package:caffeshop/data/models/response/order_list_model.dart';
import 'package:caffeshop/data/utils/dynamic_link.dart';
import 'package:caffeshop/presentations/blocs/order/order_history_bloc.dart';
import 'package:caffeshop/presentations/blocs/payment/gopay_payment_bloc.dart';
import 'package:caffeshop/presentations/screens/detail_order/detail_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    orderHistoryBloc.getOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    f.maximumFractionDigits = 0;
    return RefreshIndicator(
      onRefresh: () async {
        orderHistoryBloc.getOrderList();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.teal,
              ),
              onPressed: () {
                Get.back();
              }),
          elevation: 0,
          title: Text(
            "Riwayat Pesanan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.teal,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          Column(
            children: [
              StreamBuilder<OrderListModel>(
                stream: orderHistoryBloc.subject.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data.data;
                    if (data.length <= 0) {
                      return Expanded(
                        child:
                            Center(child: Text("Riwayat pesanan masih kosong")),
                      );
                    }
                    return Expanded(
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemCount: data.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              onTap: () {
                                Get.to(DetailOrder(
                                  id: data[i].id,
                                ));
                              },
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "No : ${data[i].noTransaction} | ${data[i].paymentMethod.paymentType}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Tanggal : ${DateFormat("dd MMM yyyy").format(data[i].updatedAt)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rp ${f.format(data[i].total)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: data[i].paymentStatus == "Pending"
                                          ? Colors.orange
                                          : data[i].paymentStatus == "Berhasil"
                                              ? Colors.green
                                              : Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      data[i].paymentStatus,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    );
                  }
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
