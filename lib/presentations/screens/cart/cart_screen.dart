import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/widget/button/custom_icon_button.dart';
import '../home/detail_item_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
              icon: Icon(Icons.close,color: Colors.teal,),
              onPressed: () {
                Get.back();
              }),
          elevation: 0,
          title: Text(
            "Keranjang",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.teal,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
          ],
        ));
  }

  Widget _buildItem() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildContent(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      children: [
        Image.asset(
          'assets/img/starbug2.png',
          width: 100,
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Minuman penyegar",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ketegori",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
                ),
              ),
            ),
            Text(
              "Rp 20.0000",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton.icon(
          onPressed: () {
            Get.to(DetailItemScreen());
          },
          icon: Icon(Icons.edit),
          label: Text(
            "Edit",
          ),
        ),
        Row(
          children: [
            CustomIconButton(
              isBorder: true,
              onPress: () {},
              title: Icon(
                CupertinoIcons.trash,
                color: Colors.teal,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomIconButton(
                isBorder: false,
                onPress: () {},
                title: Text(
                  "1",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            CustomIconButton(
              isBorder: true,
              onPress: () {},
              title: Icon(
                CupertinoIcons.plus,
                size: 20,
                color: Colors.teal
              ),
            ),
          ],
        )
      ],
    );
  }
}
