import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/masalah.dart';
import 'package:masalah/model/masalah.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/network/remote_data_source.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/screens/item/category_item.dart';
import 'package:masalah/screens/item/masalah_item.dart';

class MasalahListScreen extends StatelessWidget {
  const MasalahListScreen(
      {Key? key, required this.categoryName, required this.categoryId})
      : super(key: key);

  final String? categoryName;
  final int? categoryId;

  @override
  Widget build(BuildContext context) {
    final RemoteDataSource _apiResponse = RemoteDataSource();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppTopBar(
        enableBackBtn: true,
        title: categoryName!,
        bgColor: AppColors.bgColor,
        textColor: AppColors.primaryText,
      ),
      body: FutureBuilder(
          future: _apiResponse.getMasalahs(),
          builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
            print(snapshot.data);
            if (snapshot.data is SuccessState) {
              MasalahApi masalah = (snapshot.data as SuccessState).value;
              print("_______");
              print(masalah.masalahs!.length.toString());
              print(masalah.masalahs![0].masalahTitle);
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ...List.generate(
                      masalah.masalahs!.length,
                      (index) {
                        return MasalahItem(
                          masalah: masalah.masalahs![index],
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (snapshot.data is ErrorState) {
              String errorMessage = (snapshot.data as ErrorState).msg;
              return Text(errorMessage);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
