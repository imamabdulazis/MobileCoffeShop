import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/response/cart_model.dart';
import 'package:caffeshop/presentations/blocs/cart/delete_cart_bloc.dart';
import 'package:caffeshop/presentations/blocs/cart/get_cart_bloc.dart';
import 'package:caffeshop/presentations/screens/sumary_order/sumary_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../component/widget/button/custom_icon_button.dart';
import '../home/detail_item_screen.dart';

var f = NumberFormat('#,##0.00', 'id_ID');

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final DeleteCartBloc deleteCartBloc = DeleteCartBloc();
  @override
  void initState() {
    super.initState();
    cartBloc.getCart();
  }

  @override
  Widget build(BuildContext context) {
    f.maximumFractionDigits = 0;
    return BlocProvider(
      create: (context) => deleteCartBloc,
      child: BlocListener<DeleteCartBloc, DeleteCartState>(
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
        },
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
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return _buildItem(
                            id: data[i].id,
                            idDrink: data[i].drink.id,
                            image: data[i].drink.imageUrl,
                            title: data[i].drink.name,
                            kategori: data[i].drink.category.name,
                            price: data[i].drink.price,
                            amount: data[i].amount,
                          );
                        });
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

  Widget _buildItem({
    String id,
    String idDrink,
    String image,
    String title,
    String kategori,
    String price,
    int amount,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildContent(
              image: image,
              title: title,
              kategori: kategori,
              price: price,
            ),
            _buildFooter(
              id: id,
              idDrink: idDrink,
              amount: amount,
              categoryName: kategori,
              imageUrl: image,
              price: price,
              name: title,
            ),
          ],
        ),
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
          width: 100,
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                kategori,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
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
    int amount,
    String id,
    String idDrink,
    String name,
    String categoryName,
    String imageUrl,
    String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton.icon(
          onPressed: () {
            Get.to(DetailItemScreen(
              id: idDrink,
              isUpdate: true,
              amount: amount,
            ));
          },
          icon: Icon(Icons.edit, size: 20),
          label: Text(
            "Edit",
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            Get.to(SumaryOrder(
              drinkId: idDrink,
              name: name,
              categoryName: categoryName,
              imageUrl: imageUrl,
              qty: amount,
              price: int.parse(price),
            ));
          },
          icon: Icon(Icons.payment, size: 20),
          label: Text(
            "Checkout",
          ),
        ),
        Row(
          children: [
            CustomIconButton(
              isBorder: true,
              onPress: () {
                deleteCartBloc.add(OnDeleteCartEvent(idDrink));
              },
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
          ],
        )
      ],
    );
  }
}
