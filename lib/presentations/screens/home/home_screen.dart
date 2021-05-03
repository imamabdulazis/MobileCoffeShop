import 'package:caffeshop/presentations/screens/cart/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isActiveIndex = 0;

  void onChangeIndex(int index) {
    Future.delayed(
      Duration.zero,
      () => setState(() {
        isActiveIndex = index;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: VerticalTabs(
          tabsWidth: 70,
          initialIndex: 0,
          indicatorColor: Colors.transparent,
          backgroundColor: CupertinoColors.white,
          selectedTabBackgroundColor: Colors.transparent,
          contentScrollAxis: Axis.vertical,
          tabsElevation: 2,
          onSelect: onChangeIndex,
          tabs: <Tab>[
            Tab(child: _buildButtonTab(index: 0, title: "Expresso")),
            Tab(child: _buildButtonTab(index: 1, title: "Non Coffe")),
            Tab(child: _buildButtonTab(index: 2, title: "Flavor")),
            Tab(child: _buildButtonTab(index: 3, title: "Manual Brew")),
            Tab(child: _buildButtonTab(index: 4, title: "Traditional")),
            Tab(child: _buildButtonTab(index: 5, title: "Signature")),
          ],
          contents: <Widget>[
            CategoryScreen(),
            CategoryScreen(),
            CategoryScreen(),
            CategoryScreen(),
            CategoryScreen(),
            CategoryScreen(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: () {},
        label: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total 4 item",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Rp 240.000",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Text(
              "PESAN",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 5),
            Icon(
              CupertinoIcons.chevron_right_circle,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonTab({int index, String title}) {
    return Container(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: isActiveIndex == index ? Colors.teal : Colors.white,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.extraLightBackgroundGray,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              CupertinoIcons.heart_fill,
              size: 25,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: Material(
        color: Colors.teal,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
        ),
        child: InkWell(
            onTap: () {
              Get.back();
            },
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )),
      ),
      title: Text(
        "Menu",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.teal,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            CupertinoIcons.search,
            color: Colors.teal,
            size: 25,
          ),
          onPressed: () {},
        ),
        Stack(children: [
          IconButton(
            icon: Icon(
              CupertinoIcons.cart,
              color: Colors.teal,
              size: 25,
            ),
            onPressed: () {
              Get.to(CartScreen());
            },
          ),
          Positioned(
            top: 4,
            right: 4,
            child: Material(
              color: Colors.white,
              elevation: 2,
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
          )
        ])
      ],
    );
  }
}
