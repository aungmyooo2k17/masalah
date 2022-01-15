import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/model/zakat.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/no_internet.dart';

class ZakatListScreen extends StatefulWidget {
  const ZakatListScreen({Key? key}) : super(key: key);
  @override
  _ZakatListScreenState createState() => _ZakatListScreenState();
}

class _ZakatListScreenState extends State<ZakatListScreen> {
  final dbHelper = DatabaseHelper.instance;

  int masCount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppTopBar(
        enableBackBtn: true,
        title: 'Zakat List',
        bgColor: AppColors.bgColor,
        textColor: AppColors.primaryText,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder(
                future: dbHelper.queryAllZakatRows(),
                builder:
                    (BuildContext context, AsyncSnapshot<Result> snapshot) {
                  if (snapshot.data is SuccessState) {
                    List<Zakat> zakats = (snapshot.data as SuccessState).value;

                    print("***********");
                    print(snapshot);

                    return zakats.length != 0
                        ? Column(
                            children: [
                              ...List.generate(
                                zakats.length,
                                (index) {
                                  return Text(zakats[index].zakatId.toString());
                                },
                              ),
                            ],
                          )
                        : NoInternet();
                  } else if (snapshot.data is ErrorState) {
                    String errorMessage = (snapshot.data as ErrorState).msg;
                    return Text(errorMessage);
                  } else {
                    print("#############################");
                    print(snapshot);
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
