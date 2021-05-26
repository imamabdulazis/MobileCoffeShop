import 'package:caffeshop/data/utils/money_formatter.dart';
import 'package:caffeshop/data/utils/my_font.dart';
import 'package:caffeshop/presentations/screens/payment_vendor/local_widget/my_divider.dart';
import 'package:flutter/material.dart';

class PayData extends StatelessWidget {
  final String total;
  final String number;

  const PayData({Key key, this.total, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL',
                style: MyFont.Headline3TextStyle.copyWith(
                    fontSize: 16, color: textDarkGrey),
              ),
              Text(formatRupiah(double.parse(total)),
                  style: MyFont.Headline5TextStyle.copyWith(
                      color: greenIcon, fontSize: 16))
            ],
          ),
          MyDivider(paddingV: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No. Tranaksi',
                style: MyFont.Body1TextStyle,
              ),
              Text(
                number,
                style: MyFont.Body1TextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}