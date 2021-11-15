import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/model/masalah.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/network/remote_data_source.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/no_internet.dart';
import 'package:masalah/screens/item/masalah_item.dart';

class MasalahListScreen extends StatefulWidget {
  const MasalahListScreen(
      {Key? key, required this.categoryName, required this.categoryId})
      : super(key: key);
  final String? categoryName;
  final int? categoryId;
  @override
  _MasalahListScreenState createState() => _MasalahListScreenState();
}

class _MasalahListScreenState extends State<MasalahListScreen> {
  ConnectivityResult? _connectionStatus;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final RemoteDataSource _apiResponse = RemoteDataSource();
  final dbHelper = DatabaseHelper.instance;

  final _searchController = TextEditingController();
  int masCount = 0;

  @override
  void initState() {
    dbHelper.queryMasalahRowCount().then((value) => () {
          masCount = value!;
        });
    _searchController.addListener(() {
      //here you have the changes of your textfield

      //use setState to rebuild the widget
      setState(() {});
    });
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppTopBar(
        enableBackBtn: true,
        title: widget.categoryName!,
        bgColor: AppColors.bgColor,
        textColor: AppColors.primaryText,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: BorderRadius.circular(120.0)),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Search masalah here",
                    fillColor: Colors.white70),
              ),
            ),
            FutureBuilder(
                future: _searchController.text != "" ||
                        _connectionStatus == ConnectivityResult.none
                    ? dbHelper.queryAllMasalahRows(_searchController.text)
                    : _apiResponse.getMasalahs(),
                builder:
                    (BuildContext context, AsyncSnapshot<Result> snapshot) {
                  if (snapshot.data is SuccessState) {
                    List<Masalah> masalahs =
                        (snapshot.data as SuccessState).value;
                    if (_connectionStatus != ConnectivityResult.none &&
                        masCount == 0) {
                      masalahs.forEach((element) async {
                        Map<String, dynamic> row = {
                          DatabaseHelper.masalahId: element.masalahId,
                          DatabaseHelper.masalahTitle: element.masalahTitle,
                          DatabaseHelper.masalahDescription:
                              element.masalahDescription,
                          DatabaseHelper.masalahRefrence:
                              element.masalahRefrence,
                          DatabaseHelper.masalahCategoryId:
                              element.masalahCategoryId,
                        };
                        await dbHelper.insertMasalah(row);
                      });
                    }
                    return masalahs.length != 0
                        ? Column(
                            children: [
                              ...List.generate(
                                masalahs.length,
                                (index) {
                                  return MasalahItem(
                                    masalah: masalahs[index],
                                  );
                                },
                              ),
                            ],
                          )
                        : NoInternet();
                  } else if (snapshot.data is ErrorState) {
                    String errorMessage = (snapshot.data as ErrorState).msg;
                    return Text(errorMessage);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result);
        break;
      default:
        setState(() => _connectionStatus = ConnectivityResult.none);
        break;
    }
  }
}
