import 'package:caffeshop/component/widget/button/favorite_button.dart';
import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/presentations/blocs/drink/drink_bloc.dart';
import 'package:caffeshop/presentations/screens/home/detail_item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  final String id;
  final String namaKategori;

  const CategoryScreen({
    Key key,
    this.id,
    this.namaKategori,
  }) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    drinkBloc.getDrink(widget.id);
    super.initState();
  }

  @override
  void didUpdateWidget(CategoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      drinkBloc.getDrink(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.5;

    return RefreshIndicator(
      onRefresh: () async {
        drinkBloc.getDrink(widget.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                widget.namaKategori,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            StreamBuilder<DrinkModel>(
              stream: drinkBloc.subject.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data.data;
                  if (data.length <= 0) {
                    return Expanded(
                      child: Text("Minuman belum tersedia"),
                    );
                  }
                  return Flexible(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemCount: data.length,
                      padding: const EdgeInsets.only(bottom: 50, top: 15),
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                DetailItemScreen(
                                  id: data[index].id,
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    margin: EdgeInsets.zero,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          data[index].imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: -2,
                                          right: -2,
                                          child: FavoritButton(
                                            onPress: () {},
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: itemWidth,
                                    child: Text(
                                      data[index].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: itemWidth,
                                    child: Text(
                                      data[index].price,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
