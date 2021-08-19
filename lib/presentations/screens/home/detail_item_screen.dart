import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/widget/button/custom_icon_button.dart';
import 'package:caffeshop/component/widget/button/favorite_button.dart';
import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/add_cart_body.dart';
import 'package:caffeshop/data/models/request/cart_body.dart';
import 'package:caffeshop/data/models/request/favorite_body.dart';
import 'package:caffeshop/data/models/request/update_cart_body.dart';
import 'package:caffeshop/data/models/response/detail_drink_model.dart';
import 'package:caffeshop/presentations/blocs/cart/add/add_cart_bloc.dart';
import 'package:caffeshop/presentations/blocs/cart/update_cart_bloc.dart';
import 'package:caffeshop/presentations/blocs/drink/detail_drink_bloc.dart';
import 'package:caffeshop/presentations/blocs/favorite/favorite_bloc.dart';
import 'package:caffeshop/presentations/screens/cart/cart_screen.dart';
import 'package:caffeshop/presentations/screens/sumary_order/sumary_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class DetailItemScreen extends StatefulWidget {
  final String id;
  final bool isUpdate;
  final int quantity;

  const DetailItemScreen({
    Key key,
    @required this.id,
    @required this.isUpdate,
    this.quantity,
  }) : super(key: key);

  @override
  _DetailItemScreenState createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  final FavoriteBloc favoriteBloc = FavoriteBloc();
  final AddCartBloc addCartBloc = AddCartBloc();
  final UpdateCartBloc updateCartBloc = UpdateCartBloc();
  final prefs = SharedPreferencesManager();
  int quantity = 1;
  int stock = 0;

  @override
  void initState() {
    super.initState();
    detailDrinkBloc.getDetailDrink(widget.id);

    if (widget.isUpdate) {
      setState(() {
        quantity = widget.quantity;
      });
    }
  }

  void onAddPress() {
    setState(() {
      quantity += 1;
    });
  }

  void onMinPress() {
    setState(() {
      quantity != 1 ? quantity -= 1 : quantity = 1;
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
    if (widget.isUpdate) {
      // updateCartBloc.add(OnUpdateCartEvent(UpdateCartBody(
      //   drinkId: widget.id,
      //   quantity: quantity,
      // )));
    } else {
      addCartBloc.add(OnAddCartEvent(AddCartBody(
        drinkId: widget.id,
        userId: prefs.getString(SharedPreferencesManager.keyIdUser),
        quantity: quantity,
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    f.maximumFractionDigits = 0;

    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => favoriteBloc,
        ),
        BlocProvider(
          create: (context) => addCartBloc,
        ),
        BlocProvider(
          create: (context) => updateCartBloc,
        ),
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
          BlocListener<AddCartBloc, AddCartState>(
            listener: (context, state) {
              if (state is AddCartFailure) {
                Get.snackbar(
                  'Gagal',
                  state.message,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              } else if (state is AddCartSuccess) {
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
          BlocListener<UpdateCartBloc, UpdateCartState>(
            listener: (context, state) {
              if (state is UpdateCartFailure) {
                Get.snackbar(
                  'Gagal',
                  state.message,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              } else if (state is UpdateCartSuccess) {
                Get.snackbar(
                  'Berhasil',
                  "Berhasil Update >Keranjang",
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
                    stock = data.stock;
                    return Stack(children: [
                      ListView(
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
                                      data.name,
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25,
                                      ),
                                    ),
                                    FavoritButton(
                                      onPress: addFavorite,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      color: Colors.blue,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        data.category.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Stock : ${data.stock}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
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
                                  "Rp ${f.format(int.parse(data.price))}",
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _buildAddButton(data.stock),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _buildButtonBottom(
                        quantity: quantity,
                        idDrink: data.id,
                        name: data.name,
                        categoryName: data.category.name,
                        imageUrl: data.imageUrl,
                        price: data.price,
                      ),
                    ]);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              BlocBuilder<FavoriteBloc, FavoriteState>(
                  builder: (context, state) {
                if (state is FavoriteLoading) {
                  return LoaderWidget(title: "Tambah Favorite");
                }
                return const SizedBox.shrink();
              }),
              BlocBuilder<AddCartBloc, AddCartState>(builder: (context, state) {
                if (state is AddCartLoading) {
                  return LoaderWidget(title: "Tambah Keranjang");
                }
                return const SizedBox.shrink();
              }),
              BlocBuilder<UpdateCartBloc, UpdateCartState>(
                  builder: (context, state) {
                if (state is UpdateCartLoading) {
                  return LoaderWidget(title: "Update Keranjang");
                }
                return const SizedBox.shrink();
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton(int stock) {
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
              "$quantity",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        CustomIconButton(
          isBorder: true,
          onPress: quantity == stock || stock == 0 ? null : onAddPress,
          title: Icon(CupertinoIcons.plus, size: 20, color: Colors.teal),
        ),
      ],
    );
  }

  Widget _buildButtonBottom({
    int quantity,
    String idDrink,
    String name,
    String categoryName,
    String imageUrl,
    String price,
  }) {
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
              onPress: () {
                addCart();
                Future.delayed(Duration(milliseconds: 700), () {
                  Get.to(CartScreen());
                });
              },
              // Get.to(SumaryOrder(
              //   drinkId: idDrink,
              //   name: name,
              //   categoryName: categoryName,
              //   imageUrl: imageUrl,
              //   qty: quantity,
              //   price: int.parse(price),
              // ));
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
          onTap: stock == 0 ? null : onPress,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  title == "Keranjang"
                      ? Icon(FeatherIcons.shoppingCart, size: 15)
                      : const SizedBox.shrink(),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: color == Colors.grey ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
