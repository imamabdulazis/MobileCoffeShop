import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/gopay_body.dart';
import 'package:caffeshop/data/utils/dynamic_link.dart';
import 'package:caffeshop/presentations/blocs/payment/gopay_payment_bloc.dart';
import 'package:caffeshop/presentations/screens/payment_vendor/local_widget/gojek_manual.dart';
import 'package:caffeshop/presentations/screens/payment_vendor/local_widget/pay_data.dart';
import 'package:caffeshop/presentations/screens/payment_vendor/local_widget/payment_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class GojekPayScreen extends StatefulWidget {
  final String uuid;
  final String total;
  final String number;

  const GojekPayScreen({
    Key key,
    this.uuid,
    this.total,
    this.number,
  }) : super(key: key);

  @override
  _GojekPayScreenState createState() => _GojekPayScreenState();
}

class _GojekPayScreenState extends State<GojekPayScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GopayPaymentBloc gopayPaymentBloc = GopayPaymentBloc();
  final DynamicLinkService dynamicLinkService = DynamicLinkService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => gopayPaymentBloc,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Bayar via GoPay',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ).copyWith(color: Colors.white)),
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocListener<GopayPaymentBloc, GopayPaymentState>(
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
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        PayData(
                          total: widget.total,
                          number: widget.number,
                        ),
                        SizedBox(height: 8),
                        GojekManual(),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        top: 18, left: 18, right: 18, bottom: 18),
                    child: _buildRoundButton(
                      context,
                      widget.uuid,
                      int.parse(
                        widget.total,
                      ),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }

  launchURL(url) async {
    await launch(url);
  }

  _onPay() async {
    var dynamicLink =
        await dynamicLinkService.createDynamicLinkHome(widget.uuid);
    gopayPaymentBloc.add(OnGopayPaymentEvent(GopayBody(
      orderId: widget.uuid,
      callbackUrl: "$dynamicLink",
    )));
  }

  Widget _buildRoundButton(BuildContext context, String uuid, int total) {
    return PrimarygGreenButton(
      text: 'Bayar Sekarang',
      function: _onPay,
    );
  }
}
