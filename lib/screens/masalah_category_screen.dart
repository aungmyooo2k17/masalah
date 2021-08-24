import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/model/category.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/network/remote_data_source.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/no_internet.dart';
import 'package:masalah/screens/item/category_item.dart';

class MasalahCategoryScreen extends StatefulWidget {
  @override
  _MasalahCategoryScreenState createState() => _MasalahCategoryScreenState();
}

class _MasalahCategoryScreenState extends State<MasalahCategoryScreen> {
  ConnectivityResult? _connectionStatus;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final RemoteDataSource _apiResponse = RemoteDataSource();
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
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
        title: "CATEGORY",
        bgColor: AppColors.bgColor,
        textColor: AppColors.primaryText,
      ),
      body: FutureBuilder(
          future: _connectionStatus == ConnectivityResult.none
              ? dbHelper.queryAllCategoryRows()
              : _apiResponse.getCategories(),
          builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
            print(snapshot.data);
            if (snapshot.data is SuccessState) {
              List<Category> categories = (snapshot.data as SuccessState).value;
              if (_connectionStatus != ConnectivityResult.none) {
                categories.forEach((element) async {
                  Map<String, dynamic> row = {
                    DatabaseHelper.categoryName: element.categoryName,
                    DatabaseHelper.categoryId: element.categoryId,
                    DatabaseHelper.masalahCount: element.masalahCount,
                  };
                  await dbHelper.insertCategory(row);
                });
              }
              return categories.length != 0
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ...List.generate(
                            categories.length,
                            (index) {
                              if (categories[index].masalahCount != 0)
                                return CategoryItem(
                                    category: categories[index]);

                              return SizedBox
                                  .shrink(); // here by default width and height is 0
                            },
                          ),
                        ],
                      ),
                    )
                  : NoInternet();
            } else if (snapshot.data is ErrorState) {
              String errorMessage = (snapshot.data as ErrorState).msg;
              return Text(errorMessage);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
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
