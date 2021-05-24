import 'package:caffeshop/data/models/response/cart_model.dart';
import 'package:caffeshop/presentations/blocs/cart/get_cart_bloc.dart';
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
  void initState() {
    super.initState();
    cartBloc.getCart();
  }

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
          "Keranjang",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.teal,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<CartModel>(
        stream: cartBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data.data;
            return ListView.builder(itemBuilder: (context, i) {
              return _buildItem(
                image: data[i].drink.imageUrl,
                title: data[i].drink.name,
                kategori: data[i].drink.category.name,
                price: data[i].drink.price,
                amount: data[i].amount,
              );
            });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildItem({
    String image,
    String title,
    String kategori,
    String price,
    int amount,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildContent(
              image: image,
              title: title,
              kategori: kategori,
              price: price,
            ),
            _buildFooter(
              amount: amount,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent({
    String image,
    String title,
    String kategori,
    String price,
  }) {
    return Row(
      children: [
        Image.network(
          image,
          width: 100,
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                kategori,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
                ),
              ),
            ),
            Text(
              price,
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

  Widget _buildFooter({int amount}) {
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
                  "$amount",
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
              title: Icon(CupertinoIcons.plus, size: 20, color: Colors.teal),
            ),
          ],
        )
      ],
    );
  }
}
