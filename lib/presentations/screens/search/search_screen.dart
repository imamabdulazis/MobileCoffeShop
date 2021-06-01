import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/widget/button/favorite_button.dart';
import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/favorite_body.dart';
import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/presentations/blocs/drink/search_drink_bloc.dart';
import 'package:caffeshop/presentations/blocs/favorite/favorite_bloc.dart';
import 'package:caffeshop/presentations/screens/home/detail_item_screen.dart';
import 'package:caffeshop/presentations/screens/search/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FavoriteBloc favoriteBloc = FavoriteBloc();

  final prefs = SharedPreferencesManager();
  String _searchTerm = '';

  void _updateSearchTerm(String query) {
    _searchTerm = query;
    searchDrinkBloc.getDrink(query);
  }

  @override
  void initState() {
    _updateSearchTerm("");
    super.initState();
  }

  void addFavorite(id) {
    favoriteBloc.add(OnAddFavorite(
      FavoriteBody(
          drinkId: id,
          userId: prefs.getString(SharedPreferencesManager.keyIdUser)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    f.maximumFractionDigits = 0;

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.5;
    return BlocProvider(
      create: (context) => favoriteBloc,
      child: RefreshIndicator(
        onRefresh: () async {
          _updateSearchTerm(_searchTerm);
        },
        child: Scaffold(
          appBar: AppBar(
            title: SearchField(
              onChange: _updateSearchTerm,
            ),
          ),
          body: BlocListener<FavoriteBloc, FavoriteState>(
            listener: (context, state) {
              if (state is FavoriteFailure) {
                Get.snackbar(
                  'Gagal',
                  state.message,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              } else if (state is FavoriteSuccess) {
                Get.snackbar(
                  'Berhasil',
                  "Berhasil tambah favorit",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              }
            },
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  StreamBuilder<DrinkModel>(
                    stream: searchDrinkBloc.subject.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data.data;
                        if (data.length <= 0) {
                          return Expanded(
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                      'assets/img/search.png',
                                      fit: BoxFit.cover),
                                ),
                                Text("Pencarian tidak ditemukan")
                              ],
                            )),
                          );
                        }
                        return Flexible(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                        isUpdate: false,
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                          margin: EdgeInsets.zero,
                                          color: Colors.white,
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                height: 150,
                                                child: Image.network(
                                                  data[index].imageUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                top: -2,
                                                right: -2,
                                                child: FavoritButton(
                                                  onPress: () => addFavorite(
                                                      data[index].id),
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
                                            "Rp ${f.format(int.parse(data[index].price))}",
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
                ]),
              ),
              BlocBuilder<FavoriteBloc, FavoriteState>(
                  builder: (context, state) {
                if (state is FavoriteLoading) {
                  return LoaderWidget(title: "Menambah ke favorite...");
                }
                return const SizedBox.shrink();
              })
            ]),
          ),
        ),
      ),
    );
  }
}
