import 'package:caffeshop/data/utils/my_font.dart';
import 'package:caffeshop/presentations/screens/payment_vendor/local_widget/my_divider.dart';
import 'package:flutter/material.dart';

class GojekManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cara Pembayaran',
                style: MyFont.Headline6TextStyle,
              ),
              SizedBox(
                width: 48,
                child: Image.asset(
                  'assets/img/gopay.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          MyDivider(paddingV: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1.',
                style: MyFont.Body1TextStyle,
              ),
              SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: MyFont.Body1TextStyle.copyWith(fontSize: 12.5),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Klik tombol',
                      ),
                      TextSpan(
                          text: ' ‘Bayar Sekarang’ ',
                          style:
                              MyFont.Headline6TextStyle.copyWith(fontSize: 12)),
                      TextSpan(
                        text: 'di bawah',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2.',
                style: MyFont.Body1TextStyle,
              ),
              SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: MyFont.Body1TextStyle.copyWith(fontSize: 12.5),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Anda akan diarahkan menuju halaman pembayaran',
                      ),
                      TextSpan(
                          text: ' GoPay ',
                          style:
                              MyFont.Headline6TextStyle.copyWith(fontSize: 12)),
                      TextSpan(
                        text: 'di aplikasi Gojek',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '3.',
                style: MyFont.Body1TextStyle,
              ),
              SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: MyFont.Body1TextStyle.copyWith(fontSize: 12.5),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Cek dan',
                      ),
                      TextSpan(
                          text: ' pastikan nominal pembayaran ',
                          style:
                              MyFont.Headline6TextStyle.copyWith(fontSize: 12)),
                      TextSpan(
                        text: 'yang ditampilkan telah ',
                      ),
                      TextSpan(
                          text: 'sesuai',
                          style:
                              MyFont.Headline6TextStyle.copyWith(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '4.',
                style: MyFont.Body1TextStyle,
              ),
              SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: MyFont.Body1TextStyle.copyWith(fontSize: 12.5),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Klik tombol',
                      ),
                      TextSpan(
                          text: ' ‘Bayar’ ',
                          style:
                              MyFont.Headline6TextStyle.copyWith(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5.',
                style: MyFont.Body1TextStyle,
              ),
              SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: MyFont.Body1TextStyle.copyWith(fontSize: 12.5),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Masukkan',
                      ),
                      TextSpan(
                          text: ' PIN ',
                          style:
                              MyFont.Headline6TextStyle.copyWith(fontSize: 12)),
                      TextSpan(
                        text: 'GoPay',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '6.',
                style: MyFont.Body1TextStyle,
              ),
              SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: MyFont.Body1TextStyle.copyWith(fontSize: 12.5),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Pembayaran',
                      ),
                      TextSpan(
                          text: ' selesai',
                          style:
                              MyFont.Headline6TextStyle.copyWith(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
