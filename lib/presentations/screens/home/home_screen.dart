import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(),
      body: VerticalTabs(
        tabsWidth: 70,
        indicatorColor: Colors.teal,
        contentScrollAxis: Axis.vertical,
        onSelect: (index) {
          print(index);
        },
        tabs: <Tab>[
          Tab(child: _buildButtonTab(isActive: false)),
          Tab(child: _buildButtonTab(isActive: false)),
          Tab(child: _buildButtonTab(isActive: false)),
          Tab(child: _buildButtonTab(isActive: false)),
          Tab(child: _buildButtonTab(isActive: false)),
        ],
        contents: <Widget>[
          Container(child: Text('Flutter'), padding: EdgeInsets.all(20)),
          Container(child: Text('Dart'), padding: EdgeInsets.all(20)),
          Container(child: Text('NodeJS'), padding: EdgeInsets.all(20)),
          Container(child: Text('PHP'), padding: EdgeInsets.all(20)),
          Container(child: Text('HTML 5'), padding: EdgeInsets.all(20))
        ],
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

  Widget _buildButtonTab({
    bool isActive,
  }) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: isActive ? Colors.teal : Colors.transparent,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.heart_fill,
            size: 25,
            color: Colors.teal,
          ),
          Text(
            "Favorit",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          )
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
