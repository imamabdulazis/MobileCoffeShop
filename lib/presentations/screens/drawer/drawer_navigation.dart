import 'dart:ui';

import 'package:caffeshop/component/widget/custom_drawer/commons/collapsing_navigation_drawer_widget.dart';
import 'package:caffeshop/presentations/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Collapsing Navigation Drawer/Sidebar",
        ),
        leading: IconButton(
          color: Colors.teal,
          icon: Icon(
            CupertinoIcons.text_alignright,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: Container(
        width: size.width / 1.5,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: CupertinoColors.extraLightBackgroundGray,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          minRadius: 36,
                          backgroundColor: Colors.teal,
                          child: CircleAvatar(
                            minRadius: 34,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                              'https://randomuser.me/api/portraits/women/11.jpg',
                            ),
                          ),
                        ),
                        const SizedBox.shrink(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('IMAM',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 5),
                    Text('Lihat Profil',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        )),
                  ],
                ),
              ),
              ListTile(
                title: _buildTitleMenuDrawer(title: 'Riwayat Pemesanan'),
                onTap: () {},
              ),
              ListTile(
                title: _buildTitleMenuDrawer(title: 'Alamat Tersimpan'),
                onTap: () {},
              ),
              ListTile(
                title: _buildTitleMenuDrawer(title: 'Pembayaran'),
                onTap: () {},
              ),
              ListTile(
                title: _buildTitleMenuDrawer(title: 'Pusat Bantuan'),
                onTap: () {},
              ),
              ListTile(
                title: _buildTitleMenuDrawer(title: 'Pengaturan'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: _buildTitleMenuDrawer(title: 'Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/img/bg.jpeg',
                ),
              ),
            ),
            height: size.height,
          ),
          Container(
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.transparent,
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          _buildContent(size),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.teal,
              child: InkWell(
                onTap: () {
                  Get.to(HomeScreen());
                },
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
                            "PESAN SEKARANG",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Temukan Secangkir Kebahagiaan",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.chevron_right_circle,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitleMenuDrawer({String title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget _buildContent(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Siang",
              style: TextStyle(
                fontSize: 25,
                color: Colors.teal,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "COFFE IMAM",
              style: TextStyle(
                fontSize: 25,
                color: Colors.teal,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Santai sejenak dengan rasa\n terbaru ice gula merah kurma",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 30),

            ///card
            Container(
              width: size.width / 1.5,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
