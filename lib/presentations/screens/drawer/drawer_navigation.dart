import 'dart:ui';

import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/utils/notification.dart';
import 'package:caffeshop/data/models/response/account_model.dart';
import 'package:caffeshop/presentations/blocs/account/account_bloc.dart';
import 'package:caffeshop/presentations/screens/favorite/favorite_screen.dart';
import 'package:caffeshop/presentations/screens/login/login_screen.dart';
import 'package:caffeshop/presentations/screens/riwayat_pesanan/riwayat_pesanan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account/account_screen.dart';
import '../home/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final NotificationService notificationService = NotificationService();
  final prefs = SharedPreferencesManager();

  @override
  void initState() {
    super.initState();
    accountBloc.getAccount(prefs.getString(SharedPreferencesManager.keyIdUser));
    notificationService.initialize();
  }

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
                  child: StreamBuilder<AccountModel>(
                    stream: accountBloc.subject.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data.data);
                        var data = snapshot.data.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  minRadius: 25,
                                  backgroundColor: Colors.teal,
                                  child: CircleAvatar(
                                    minRadius: 23,
                                    backgroundColor: CupertinoColors
                                        .extraLightBackgroundGray,
                                    backgroundImage: NetworkImage(
                                      data.imageUrl,
                                    ),
                                  ),
                                ),
                                const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(data.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(data.email,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: () {
                                Get.to(AccountScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                                child: Text('Lihat Profil',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    )),
                              ),
                            ),
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )),
              ListTile(
                title: _buildTitleMenuDrawer(title: 'Favorit'),
                onTap: () {
                  Get.to(FavoriteScreen());
                },
              ),
              ListTile(
                title: _buildTitleMenuDrawer(title: 'Riwayat Pemesanan'),
                onTap: () {
                  Get.to(RiwayatPesanan());
                },
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
                onTap: () {
                  prefs.clearAll();
                  Get.offAll(LoginScreen());
                },
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
          _buildButtonBottom(),
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
              "Selamat Datang,",
              style: TextStyle(
                fontSize: 25,
                color: Colors.teal,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Copsychus Coffe",
              style: TextStyle(
                fontSize: 25,
                color: Colors.teal,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Santai sejenak dengan rasa\n terbaru Dear Marie",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 30),

            ///card
            // Container(
            //   width: size.width / 1.5,
            //   height: 100,
            //   decoration: BoxDecoration(
            //     color: Colors.white.withOpacity(0.5),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonBottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.teal,
        child: InkWell(
          onTap: () {
            Get.to(
              HomeScreen(),
              transition: Transition.downToUp,
              duration: Duration(milliseconds: 400),
            );
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
                    CupertinoIcons.chevron_up_circle,
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
    );
  }
}
