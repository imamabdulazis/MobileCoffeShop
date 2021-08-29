import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/order_kasir_body.dart';
import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/presentations/blocs/drink/get_all_drink_bloc.dart';
import 'package:caffeshop/presentations/blocs/kasir/order_kasir_bloc.dart';
import 'package:caffeshop/presentations/screens/kasir/drawer_kasir.dart';
import 'package:caffeshop/presentations/screens/kasir/drink_item.dart';
import 'package:caffeshop/presentations/screens/kasir/receipt.dart';
import 'package:caffeshop/presentations/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class Kasir extends StatefulWidget {
  const Kasir({Key key}) : super(key: key);

  @override
  _KasirState createState() => _KasirState();
}

class _KasirState extends State<Kasir> {
  ValueNotifier<List<DrinkItemModel>> temDrink = ValueNotifier([]);

  OrderKasirBloc orderKasirBloc = OrderKasirBloc();

  final prefs = SharedPreferencesManager();

  int total = 0;
  @override
  void initState() {
    getAllDrinkBloc.fetchAllDrink();
    super.initState();
  }

  @override
  void dispose() {
    getAllDrinkBloc.dispose();
    super.dispose();
  }

  void onAddDrink(DrinkData el) {
    if (total < 0) {
      total = 0;
    }
    print("ADD");
    var objIndex = temDrink.value.indexWhere((e) => e.id == el.id);

    if (objIndex == -1) {
      temDrink.value = List.of(temDrink.value)
        ..add(
          DrinkItemModel(
            id: el.id,
            name: el.name,
            price: el.price,
            quantity: 1,
          ),
        );
      total += int.parse(el.price);
    } else {
      List<DrinkItemModel> drink = List.from(temDrink.value);
      drink[objIndex].quantity += 1;
      temDrink.value = drink;
      if (el.id == temDrink.value[objIndex].id) {
        total = int.parse(temDrink.value[objIndex].price) *
            temDrink.value[objIndex].quantity;
      } else {
        total += int.parse(temDrink.value[objIndex].price) *
            temDrink.value[objIndex].quantity;
      }
    }
  }

  void onDeleteItem(String id) {
    var objIndex = temDrink.value.indexWhere((e) => e.id == id);
    List<DrinkItemModel> drink = List.from(temDrink.value);
    if (drink[objIndex].quantity <= 1) {
      total -= int.parse(drink[objIndex].price);
      temDrink.value = List.of(temDrink.value)
        ..removeWhere((element) => element.id == id);
    } else {
      drink[objIndex].quantity -= 1;
      temDrink.value = drink;
      total -= int.parse(drink[objIndex].price);
    }
  }

  void onCheckout() {
    orderKasirBloc.add(
      OnOrderKasirEvent(
        OrderKasirBody(
          userId: prefs.getString(SharedPreferencesManager.keyIdUser),
          drinks: temDrink.value,
          total: total,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    f.maximumFractionDigits = 0;

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.6;
    final double itemWidth = size.width / 6;
    return BlocProvider(
      create: (context) => orderKasirBloc,
      child: RefreshIndicator(
        onRefresh: () => Future.sync(() => getAllDrinkBloc.fetchAllDrink()),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Pilih Minuman"),
            leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => showAlertDialog(context),
            ),
          ),
          body: BlocListener<OrderKasirBloc, OrderKasirState>(
            listener: (context, state) {
              if (state is OrderKasirFailure) {
                Get.snackbar(
                  'Gagal',
                  state.message,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              } else if (state is OrderKasirSuccess) {
                total = 0;
                temDrink.value = List.of(temDrink.value)..clear();
                Get.dialog(
                  Dialog(
                    child: Receipt(
                      detail: state.response,
                    ),
                  ),
                );
              }
            },
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          StreamBuilder<DrinkModel>(
                            stream: getAllDrinkBloc.subject.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data.data;
                                if (snapshot.data.data == null ||
                                    snapshot.data.error != null) {
                                  return Center(
                                      child: Text("Terjadi kesalahan server"));
                                } else if (data.length <= 0) {
                                  return Expanded(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Image.asset(
                                              'assets/img/cup.png',
                                              fit: BoxFit.cover),
                                        ),
                                        Text("Minuman belum tersedia"),
                                        SizedBox(height: 150),
                                      ],
                                    )),
                                  );
                                }
                                return Flexible(
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 10,
                                      childAspectRatio:
                                          (itemWidth / itemHeight),
                                    ),
                                    itemCount: data.length,
                                    padding: const EdgeInsets.only(
                                        bottom: 50, top: 15),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return DrinkItem(
                                        onPress: () => onAddDrink(data[index]),
                                        imageUrl: data[index].imageUrl,
                                        name: data[index].name,
                                        price: data[index].price,
                                        stock: data[index].stock,
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
                    ),
                    ValueListenableBuilder(
                      valueListenable: temDrink,
                      builder: (context, _, __) => DrawerCasier(
                        onDelete: (String id) => onDeleteItem(id),
                        drinks: temDrink.value,
                        total: total,
                        onCheckout: temDrink.value.isEmpty ? null : onCheckout,
                      ),
                    )
                  ],
                ),
                BlocBuilder<OrderKasirBloc, OrderKasirState>(
                    builder: (context, state) {
                  if (state is OrderKasirLoading) {
                    return LoaderWidget(title: "Loading...");
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("BATAL"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget logoutButton = TextButton(
      child: Text("LOGOUT", style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.of(context).pop();
        Future.delayed(Duration(milliseconds: 700), () {
          prefs.clearAll();
          Get.offAll(LoginScreen());
        });
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout Aplikasi"),
      content: Text("Apakah anda akan logout aplikasi sekarang?"),
      actions: [
        cancelButton,
        logoutButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
