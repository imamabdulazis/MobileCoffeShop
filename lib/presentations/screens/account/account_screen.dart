import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/data/models/response/account_model.dart';
import 'package:caffeshop/presentations/blocs/account/account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final prefs = SharedPreferencesManager();

  @override
  void initState() {
    super.initState();
    accountBloc.getAccount(prefs.getString(SharedPreferencesManager.keyIdUser));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.teal,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Akun Saya",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.teal,
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.teal,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<AccountModel>(
              stream: accountBloc.subject.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data.data;
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              minRadius: 36,
                              backgroundColor: Colors.teal,
                              child: CircleAvatar(
                                minRadius: 34,
                                backgroundColor:
                                    CupertinoColors.extraLightBackgroundGray,
                                backgroundImage: NetworkImage(
                                  data.imageUrl,
                                ),
                              ),
                            ),
                            const SizedBox.shrink(),
                            const SizedBox(height: 10),
                            Text(data.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                              child: Text(data.email,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                              child: Text(data.telpNumber ?? "-",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ));
  }
}
