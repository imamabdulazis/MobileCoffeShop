import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/gopay_body.dart';
import 'package:caffeshop/data/models/response/order_list_model.dart';
import 'package:caffeshop/data/utils/dynamic_link.dart';
import 'package:caffeshop/presentations/blocs/order/order_history_bloc.dart';
import 'package:caffeshop/presentations/blocs/payment/gopay_payment_bloc.dart';
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
  final GopayPaymentBloc gopayPaymentBloc = GopayPaymentBloc();
  final DynamicLinkService dynamicLinkService = DynamicLinkService();

  @override
  void initState() {
    orderHistoryBloc.getOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    f.maximumFractionDigits = 0;
    return BlocProvider(
      create: (context) => gopayPaymentBloc,
      child: RefreshIndicator(
        onRefresh: () async {
          orderHistoryBloc.getOrderList();
        },
        child: BlocListener<GopayPaymentBloc, GopayPaymentState>(
          listener: (_, state) {
            if (state is GopayPaymentFailure) {
              Get.snackbar(
                'Gagal',
                state.message,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            } else if (state is GopayPaymentSuccess) {
              launchURL(state.model.data.deeplinkRedirect);
            }
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
                            child: Center(
                                child: Text("Riwayat pesanan masih kosong")),
                          );
                        }
                        return Expanded(
                          child: ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemCount: data.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  onTap: () {
                                    if (data[i].paymentStatus == "Berhasil") {
                                      Get.snackbar(
                                        'Selesai',
                                        "Order telah selesai",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.orange,
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      _onPay(data[i].id);
                                    }
                                  },
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[i].noTransaction,
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
                                  title: Text(data[i].drink.name),
                                  trailing: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        color:
                                            data[i].paymentStatus == "Pending"
                                                ? Colors.orange
                                                : data[i].paymentStatus ==
                                                        "Berhasil"
                                                    ? Colors.green
                                                    : Colors.black,
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
              BlocBuilder<GopayPaymentBloc, GopayPaymentState>(
                builder: (context, state) {
                  if (state is GopayPaymentLoading) {
                    return LoaderWidget(
                      title: "Memproses...",
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  launchURL(url) async {
    await launch(url);
  }

  _onPay(String uuid) async {
    var dynamicLink = await dynamicLinkService.createDynamicLinkHome(uuid);
    gopayPaymentBloc.add(OnGopayPaymentEvent(GopayBody(
      orderId: uuid,
      callbackUrl: "$dynamicLink",
    )));
  }
}
