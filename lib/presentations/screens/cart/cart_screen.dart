import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/drink_body.dart';
import 'package:caffeshop/data/models/request/new_order_body.dart';
import 'package:caffeshop/data/models/response/cart_model.dart';
import 'package:caffeshop/presentations/blocs/cart/delete_cart_bloc.dart';
import 'package:caffeshop/presentations/blocs/cart/get_cart_bloc.dart';
import 'package:caffeshop/presentations/blocs/new_orders/new_orders_bloc.dart';
import 'package:caffeshop/presentations/screens/cart/cart_item.dart';
import 'package:caffeshop/presentations/screens/sumary_order/sumary_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final prefs = SharedPreferencesManager();
  final DeleteCartBloc deleteCartBloc = DeleteCartBloc();
  final NewOrdersBloc newOrdersBloc = NewOrdersBloc();

  ValueNotifier<List<DrinkBody>> drinkItems =
      ValueNotifier<List<DrinkBody>>([]);

  ValueNotifier<int> total = ValueNotifier(0);

  ValueNotifier<String> cartId = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    cartBloc.getCart();
  }

  @override
  Widget build(BuildContext context) {
    f.maximumFractionDigits = 0;
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeleteCartBloc>(create: (context) => deleteCartBloc),
        BlocProvider<NewOrdersBloc>(create: (context) => newOrdersBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<DeleteCartBloc, DeleteCartState>(
              listener: (context, state) {
            if (state is DeleteCartFailure) {
              Get.snackbar(
                'Gagal',
                state.message,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            } else if (state is DeleteCartSuccess) {
              cartBloc.getCart();
              Get.snackbar(
                'Berhasil',
                "Berhasil hapus item dari keranjang",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            }
          }),
        ],
        child: RefreshIndicator(
          onRefresh: () async {
            cartBloc.getCart();
          },
          child: Scaffold(
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
            body: Stack(children: [
              StreamBuilder<CartModel>(
                stream: cartBloc.subject.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data.data;
                    if (data.length <= 0) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Image.asset('assets/img/empty-cart.png',
                                fit: BoxFit.cover),
                          ),
                          Text("Keranjangmu masih kosong")
                        ],
                      ));
                    }
                    cartId.value = data[0].cartId;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              return CartItem(
                                id: data[i].id,
                                idDrink: data[i].drink.id,
                                image: data[i].drink.imageUrl,
                                title: data[i].drink.name,
                                kategori: data[i].drink.category.name,
                                price: data[i].drink.price,
                                quantity: data[i].quantity,
                                stock: data[i].drink.stock,
                                drinkItems: drinkItems,
                                total: total,
                                onDelete: () {
                                  deleteCartBloc
                                      .add(OnDeleteCartEvent(data[i].id));
                                },
                              );
                            },
                          ),
                        ),
                        _buildFooterCart(),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              BlocBuilder<DeleteCartBloc, DeleteCartState>(
                  builder: (context, state) {
                if (state is DeleteCartLoading) {
                  return LoaderWidget(title: "Hapus dari keranjang");
                }
                return const SizedBox.shrink();
              }),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterCart() {
    return ValueListenableBuilder(
      valueListenable: total,
      builder: (context, _, __) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Rp ${total.value}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Material(
                        color: drinkItems.value.length != 0
                            ? Colors.teal
                            : Colors.grey,
                        child: InkWell(
                          onTap: drinkItems.value.length != 0
                              ? () {
                                  Get.to(SumaryOrder(
                                      body: NewOrderBody(
                                    userId: prefs.getString(
                                        SharedPreferencesManager.keyIdUser),
                                    drinks: drinkItems.value,
                                    paymentMethodId: '',
                                    cartId: cartId.value,
                                    total: total.value + 4000,
                                  )));
                                }
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Text(
                              "Checkout (${drinkItems.value.length})",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
