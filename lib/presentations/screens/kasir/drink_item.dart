import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class DrinkItem extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;
  final Function() onPress;
  const DrinkItem({
    Key key,
    this.name,
    this.price,
    this.imageUrl,
    this.onPress,
  }) : super(key: key);

  @override
  _DrinkItemState createState() => _DrinkItemState();
}

class _DrinkItemState extends State<DrinkItem> {
  @override
  Widget build(BuildContext context) {
    f.maximumFractionDigits = 0;

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.5;

    return Material(
      child: InkWell(
        onTap: widget.onPress,
        child: Card(
          child: SizedBox(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 100,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(height: 3),
                      SizedBox(
                        width: itemWidth,
                        child: Text(
                          widget.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: itemWidth,
                        child: Text(
                          "Rp ${f.format(int.parse(widget.price))}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.teal,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
