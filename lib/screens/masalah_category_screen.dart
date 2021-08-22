import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/category.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/network/remote_data_source.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/screens/item/category_item.dart';

class MasalahCategoryScreen extends StatelessWidget {
  const MasalahCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RemoteDataSource _apiResponse = RemoteDataSource();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppTopBar(
        title: "CATEGORY",
        bgColor: AppColors.bgColor,
        textColor: AppColors.primaryText,
      ),
      body: FutureBuilder(
          future: _apiResponse.getCategories(),
          builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
            print(snapshot.data);
            if (snapshot.data is SuccessState) {
              CategoryApi category = (snapshot.data as SuccessState).value;
              print("_______");
              print(category.categories!.length.toString());
              print(category.categories![0].categoryName);
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ...List.generate(
                      category.categories!.length,
                      (index) {
                        if (category.categories![index].masalahCount != 0)
                          return CategoryItem(
                              category: category.categories![index]);

                        return SizedBox
                            .shrink(); // here by default width and height is 0
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
