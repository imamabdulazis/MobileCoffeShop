import 'package:caffeshop/component/widget/button/custom_icon_button.dart';
import 'package:caffeshop/component/widget/button/favorite_button.dart';
import 'package:caffeshop/data/models/response/detail_drink_model.dart';
import 'package:caffeshop/presentations/blocs/drink/detail_drink_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailItemScreen extends StatefulWidget {
  final String id;

  const DetailItemScreen({Key key, this.id}) : super(key: key);

  @override
  _DetailItemScreenState createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  int amount = 1;

  @override
  void initState() {
    super.initState();
    detailDrinkBloc.getDetailDrink(widget.id);
  }

  void onAddPress() {
    setState(() {
      amount += 1;
    });
  }

  void onMinPress() {
    setState(() {
      amount != 1 ? amount -= 1 : amount = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          excludeHeaderSemantics: true,
          leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.teal,
              ),
              onPressed: () {
                Get.back();
              })),
      body: Stack(children: [
        StreamBuilder<DetailDrinkModel>(
          stream: detailDrinkBloc.subject.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data.data;
              return ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'detailImage',
                          child: Image.network(
                            data.imageUrl,
                            width: size.width,
                            height: size.width,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.category.name,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            FavoritButton(
                              onPress: () {},
                            )
                          ],
                        ),
                        Text(
                          data.name,
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.description,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Rp ${data.price}",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildAddButton(),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        _buildButtonBottom(),
      ]),
    );
  }

  Widget _buildAddButton() {
    return Row(
      children: [
        CustomIconButton(
          isBorder: true,
          onPress: onMinPress,
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
          onPress: onAddPress,
          title: Icon(CupertinoIcons.plus, size: 20, color: Colors.teal),
        ),
      ],
    );
  }

  Widget _buildButtonBottom() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Row(
          children: [
            _buildButton(
              title: "Keranjang",
              onPress: () => {},
              color: Colors.grey,
            ),
            _buildButton(
              title: "Checkout",
              onPress: () => {},
              color: Colors.teal,
            )
          ],
        ));
  }

  Widget _buildButton({String title, Function onPress, Color color}) {
    return Expanded(
      flex: 2,
      child: Material(
        color: color,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: color == Colors.grey ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
