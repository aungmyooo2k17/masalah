import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/masalah.dart';
import 'package:masalah/presentation/reusable_widget/app_bar.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';


class MasalahDetailScreen extends StatelessWidget {
  const MasalahDetailScreen({Key? key, required this.masalah})
      : super(key: key);

  final Masalah masalah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppTopBar(
          enableBackBtn: true,
          title: masalah.masalahTitle!,
          bgColor: AppColors.bgColor,
          textColor: AppColors.primaryText,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RegularText(
                  data: masalah.masalahDescription!,
                  fontSize: 18,
                  color: AppColors.primaryText,
                  textAlign: TextAlign.justify,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RegularText(
                        data: "Author",
                        fontSize: 12,
                        color: AppColors.primaryText,
                      ),
                      BoldText(
                        data: masalah.masalahRefrence!,
                        fontSize: 18,
                        color: AppColors.primaryText,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
