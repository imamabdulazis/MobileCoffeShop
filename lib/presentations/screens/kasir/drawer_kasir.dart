import 'package:caffeshop/data/models/request/order_kasir_body.dart';
import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/presentations/screens/kasir/kasir.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerCasier extends StatefulWidget {
  const DrawerCasier({
    Key key,
    this.drinks,
    this.total,
    this.onDelete,
    this.onCheckout,
  }) : super(key: key);
  final List<DrinkItemModel> drinks;
  final int total;
  final Function(String id) onDelete;
  final Function() onCheckout;

  @override
  _DrawerCasierState createState() => _DrawerCasierState();
}

class _DrawerCasierState extends State<DrawerCasier> {
  var tempDrink = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.extraLightBackgroundGray,
      width: Get.width / 3,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.drinks?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () => widget.onDelete(widget.drinks[index].id),
                    title: Text(
                      "Caramel capucino",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.drinks[index].quantity} x",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Rp ${f.format(int.parse(widget.drinks[index].price))}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.teal,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          ElevatedButton(
              onPressed: widget.onCheckout,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    widget.onCheckout != null ? Colors.teal : Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Checkout"),
                  Text(
                    "Rp ${f.format(widget.total)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
