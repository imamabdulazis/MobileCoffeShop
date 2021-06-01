import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpedScreen extends StatefulWidget {
  @override
  _HelpedScreenState createState() => _HelpedScreenState();
}

class _HelpedScreenState extends State<HelpedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Pusat Bantuan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.teal,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: ListView(
            children: [
              ExpansionTile(
                  title: Text(
                    "Cara mencari minuman sesuai kategori",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      child: Text(
                        "Buka halaman utama kemudian klik tombol di bawah, maka akan muncul minuman sesuai kategori",
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Cara mencari minuman semua kategori",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      child: Text(
                        "Buka halaman pencarian kemudian ketik minuman yang ingin anda cari",
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Cara memesan minuman",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      child: Text(
                        "Buka detail minuman atau bisa melalui keranjang, kemudian klik checkout button, kemudian akan masuk halaman detail pembelian, setelah itu pilih metode pembayaran, maka akan otomatis melakukan pemesanan. Anda bisa memilih untuk bayar sekarang atau melalui menu riwayat pembayaran.",
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Cara melakukan pembayaran",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      child: Text(
                        "Anda bisa melukan pembayaran sesui dengan metode pembayaran yang di pilih, setelah dipilih maka akan muncul deeplink atau aplikasi akan di teruskan ke aplikasi pihak ketiga, jika anda memilih metode pembayaran GoPay.",
                      ),
                    ),
                  ]),
            ],
          ),
        ));
  }
}
