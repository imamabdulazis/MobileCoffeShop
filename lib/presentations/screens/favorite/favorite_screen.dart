import 'package:caffeshop/component/widget/button/favorite_button.dart';
import 'package:caffeshop/data/models/response/favorite_model.dart';
import 'package:caffeshop/presentations/blocs/favorite/get_favorite_bloc.dart';
import 'package:caffeshop/presentations/screens/home/detail_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    favoriteBloc.getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.5;

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
          "Favorit",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.teal,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          StreamBuilder<FavoriteModel>(
            stream: favoriteBloc.subject.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data.data;
                if (data.length <= 0) {
                  return Expanded(
                    child: Center(child: Text("Favoritmu masih kosong")),
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
                                        data[index].drink.imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: itemWidth,
                                  child: Text(
                                    data[index].drink.name,
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
                                    data[index].drink.price,
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
          ),
        ],
      ),
    );
  }
}
