import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/widget/button/custom_icon_button.dart';
import 'package:caffeshop/component/widget/button/favorite_button.dart';
import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/cart_body.dart';
import 'package:caffeshop/data/models/request/favorite_body.dart';
import 'package:caffeshop/data/models/response/detail_drink_model.dart';
import 'package:caffeshop/presentations/blocs/cart/cart_bloc.dart';
import 'package:caffeshop/presentations/blocs/drink/detail_drink_bloc.dart';
import 'package:caffeshop/presentations/blocs/favorite/favorite_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DetailItemScreen extends StatefulWidget {
  final String id;

  const DetailItemScreen({Key key, this.id}) : super(key: key);

  @override
  _DetailItemScreenState createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  final FavoriteBloc favoriteBloc = FavoriteBloc();
  final CartBloc cartBloc = CartBloc();
  final prefs = SharedPreferencesManager();
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

  ///[FAVORITE]
  void addFavorite() {
    favoriteBloc.add(OnAddFavorite(
      FavoriteBody(
          drinkId: widget.id,
          userId: prefs.getString(SharedPreferencesManager.keyIdUser)),
    ));
  }

  ///[CART]
  void addCart() {
    print("CART");
    cartBloc.add(OnCartEvent(CartBody(
        drinkId: widget.id,
        userId: prefs.getString(SharedPreferencesManager.keyIdUser),
        amount: amount)));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => favoriteBloc,
        ),
        BlocProvider(create: (context) => cartBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FavoriteBloc, FavoriteState>(
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
                  "Berhasil tambah >favorit",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              }
            },
          ),
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is CartFailure) {
                Get.snackbar(
                  'Gagal',
                  state.mesage,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              } else if (state is CartSuccess) {
                Get.snackbar(
                  'Berhasil',
                  "Berhasil tambah >Keranjang",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              }
            },
          ),
        ],
        child: Scaffold(
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
          body: Stack(
            children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    onPress: addFavorite,
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
              BlocBuilder<FavoriteBloc, FavoriteState>(
                  builder: (context, state) {
                if (state is FavoriteLoading) {
                  return LoaderWidget(title: "Mohon tunggu");
                }
                return const SizedBox.shrink();
              }),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                if (state is CartLoading) {
                  return LoaderWidget(title: "Mohon tunggu");
                }
                return const SizedBox.shrink();
              })
            ],
          ),
        ),
      ),
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
              onPress: addCart,
              color: Colors.grey,
            ),
            _buildButton(
              title: "Checkout",
              onPress: ()=>{},
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
