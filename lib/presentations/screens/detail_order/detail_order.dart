import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/gopay_body.dart';
import 'package:caffeshop/data/models/response/detail_order_model.dart';
import 'package:caffeshop/data/utils/dynamic_link.dart';
import 'package:caffeshop/presentations/blocs/new_orders/detail/detail_order_bloc.dart';
import 'package:caffeshop/presentations/blocs/payment/gopay_payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class DetailOrder extends StatefulWidget {
  final String id;
  const DetailOrder({Key key, this.id}) : super(key: key);

  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  final GopayPaymentBloc gopayPaymentBloc = GopayPaymentBloc();
  final DynamicLinkService dynamicLinkService = DynamicLinkService();

  @override
  void initState() {
    detailOrderBloc.getDetail(widget.id);
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => gopayPaymentBloc,
      child: RefreshIndicator(
        onRefresh: () async {
          detailOrderBloc.getDetail(widget.id);
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
                "Rincian Pesanan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.teal,
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
            body: Stack(
              children: [
                StreamBuilder<DetailOrderModel>(
                  stream: detailOrderBloc.subject.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data.data;
                      print("IMUN :${data.orderItems}");
                      return Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  color: data.paymentStatus != "Berhasil"
                                      ? Colors.orange
                                      : Colors.green,
                                  child: ListTile(
                                    title: Text(
                                      "Pesanan ${data.status}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                        data.paymentStatus != "Berhasil"
                                            ? "Mohon segera melakukan pembayaran"
                                            : "Terima kasih",
                                        style: TextStyle(color: Colors.white)),
                                    trailing: Icon(
                                      Icons.money_off_csred_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: data.orderItems
                                        .map((e) => _buildDrink(
                                            name: e.drink?.name,
                                            cat: e.drink?.category?.name,
                                            image: e.drink?.imageUrl,
                                            price: int.parse(e.drink?.price),
                                            qty: e?.quantity))
                                        .toList(),
                                  ),
                                ),
                                Divider(
                                  thickness: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 15),
                                      _buildPembayarnLine(
                                        title:
                                            "Total beli ${data.orderItems.length} item",
                                        price:
                                            "Rp ${f.format(data.total - 4000)}",
                                      ),
                                      const SizedBox(height: 5),
                                      _buildPembayarnLine(
                                        title: "Biaya Transaksi",
                                        price: "Rp ${f.format(4000)}",
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Pesanan",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Rp ${f.format(data.total)}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.payments,
                                        color: Colors.teal,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Metode Pembayaran",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "${data.paymentMethod.paymentType} (${data.paymentMethod.description})",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                          data.paymentStatus != "Berhasil"
                              ? SizedBox(
                                  width: Get.width - 30,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _onPay(data.id);
                                    },
                                    child: Text("Bayar Sekarang"),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
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
              ],
            ),
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
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
