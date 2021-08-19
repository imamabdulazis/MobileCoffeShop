import 'package:caffeshop/component/widget/button/custom_icon_button.dart';
import 'package:caffeshop/data/models/request/drink_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class CartItem extends StatefulWidget {
  final String id;
  final String idDrink;
  final String image;
  final String title;
  final String kategori;
  final String price;
  final int quantity;
  final int stock;
  final Function() onDelete;
  final ValueNotifier<List<DrinkBody>> drinkItems;
  final ValueNotifier<int> total;

  const CartItem({
    Key key,
    this.id,
    this.idDrink,
    this.image,
    this.title,
    this.kategori,
    this.price,
    this.quantity,
    this.stock,
    this.onDelete,
    this.drinkItems,
    this.total,
  }) : super(key: key);
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isChecked = false;

  int quantity = 0;

  @override
  void initState() {
    setState(() {
      quantity = widget.quantity;
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CartItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.drinkItems != oldWidget.drinkItems) {
      print(widget.drinkItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: Get.width - 10,
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(Colors.teal),
                      value: isChecked,
                      onChanged: (bool value) {
                        setState(() {
                          isChecked = value;
                        });
                        if (isChecked) {
                          widget.drinkItems.value.add(DrinkBody(
                            id: widget.idDrink,
                            quantity: quantity,
                            cat: widget.kategori,
                            image: widget.image,
                            name: widget.title,
                            price: widget.price,
                          ));
                          widget.total.value +=
                              quantity * int.parse(widget.price);
                          // print(widget.drinkItems.value);
                          // print(widget.total.value);
                        } else {
                          widget.drinkItems.value.removeWhere(
                            (e) => e.id == widget.idDrink,
                          );
                          widget.total.value -=
                              quantity * int.parse(widget.price);
                          // print(widget.drinkItems.value);
                          // print(widget.total.value);
                        }
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildContent(
                          image: widget.image,
                          title: widget.title,
                          kategori: widget.kategori,
                          price: widget.price,
                        ),
                        _buildFooter(
                          id: widget.id,
                          idDrink: widget.idDrink,
                          categoryName: widget.kategori,
                          imageUrl: widget.image,
                          price: widget.price,
                          name: widget.title,
                          stock: widget.stock,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    color: Colors.red,
                    icon: Icon(CupertinoIcons.delete),
                    onPressed: widget.onDelete,
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _buildContent({
    String image,
    String title,
    String kategori,
    String price,
  }) {
    f.maximumFractionDigits = 0;
    return Row(
      children: [
        Image.network(
          image,
          width: 70,
          height: 70,
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Text(
                kategori,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
            ),
            Text(
              "Rp ${f.format(int.parse(price))}",
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

  Widget _buildFooter({
    String id,
    String idDrink,
    String name,
    String categoryName,
    String imageUrl,
    String price,
    int stock,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          width: 80,
        ),
        Row(
          children: [
            CustomIconButton(
              isBorder: true,
              onPress: () {
                if (quantity == 1) {
                  widget.onDelete();
                } else {
                  setState(() {
                    quantity -= 1;
                  });
                }
              },
              title: Icon(
                CupertinoIcons.minus,
                color: Colors.teal,
                size: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomIconButton(
                isBorder: false,
                onPress: () {},
                title: Text(
                  "$quantity",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            CustomIconButton(
              isBorder: true,
              onPress: stock <= quantity
                  ? null
                  : () {
                      setState(() {
                        quantity += 1;
                      });
                    },
              title: Icon(
                CupertinoIcons.plus,
                color: Colors.teal,
                size: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Text("Stok : $stock"),
      ],
    );
  }
}
