import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/model/zakat.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/app_text.dart';
import 'package:masalah/reusable_widget/no_internet.dart';
import 'package:masalah/screens/converter_screen/zakat_calculator_edit_screen.dart';

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

                    return zakats.length != 0
                        ? Column(
                            children: [
                              ...List.generate(
                                zakats.length,
                                (index) {
                                  return zakatItem(zakats[index]);
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

  Widget zakatItem(Zakat zakat) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularText(
                      data: "အသင်၏ပိုင်ဆိုင်မှု",
                      fontSize: 12.0,
                      color: AppColors.secondaryText,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                BoldText(
                  data: zakat.yourWorth.toString(),
                  fontSize: 14,
                  color: AppColors.primaryText,
                ),
                SizedBox(
                  height: 4,
                ),
                RegularText(
                  fontSize: 12.0,
                  color: AppColors.secondaryText,
                  data: "ရွှေဈေး / ငွေဈေး",
                ),
                BoldText(
                  data: "${zakat.goldRate} / ${zakat.silverRate}",
                  fontSize: 14,
                  color: AppColors.primaryText,
                ),
                SizedBox(
                  height: 4,
                ),
                RegularText(
                  fontSize: 12.0,
                  color: AppColors.secondaryText,
                  data: "ထိုက်သောဇကားသ်",
                ),
                BoldText(
                  data: zakat.yourZakat.toString(),
                  fontSize: 14,
                  color: AppColors.primaryText,
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryText,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RegularText(
                  data: zakat.updatedAt.toString(),
                  color: AppColors.white,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ZakatCalculatorEdit(zakatId: zakat.zakatId!)));
                  },
                  child: Container(
                    width: 38,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 18.0,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
