import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

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
            Tab(child: _buildButtonTab(index: 0)),
            Tab(child: _buildButtonTab(index: 1)),
            Tab(child: _buildButtonTab(index: 2)),
            Tab(child: _buildButtonTab(index: 3)),
            Tab(child: _buildButtonTab(index: 4)),
          ],
          contents: <Widget>[
            Container(
              color: Colors.black12,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemExtent: 100,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.white30,
                  );
                },
              ),
            ),
            Container(child: Text('Dart'), padding: EdgeInsets.all(20)),
            Container(child: Text('NodeJS'), padding: EdgeInsets.all(20)),
            Container(child: Text('PHP'), padding: EdgeInsets.all(20)),
            Container(child: Text('HTML 5'), padding: EdgeInsets.all(20))
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
            Text("PESAN"),
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

  Widget _buildButtonTab({int index}) {
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
            "${isActiveIndex == index}",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
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
        IconButton(
          icon: Icon(
            CupertinoIcons.cart,
            color: Colors.teal,
            size: 25,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
