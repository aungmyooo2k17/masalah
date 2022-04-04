import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/data/models/masalah_category_model.dart';
import 'package:masalah/data/data_sources/masalah_local_data_source.dart';
import 'package:masalah/di/get_it.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/network/remote_data_source.dart';
import 'package:masalah/presentation/blocs/masalah_category_list/masalah_category_list_bloc.dart';

import '../../../../common/constants/color_constant.dart';
import '../../../../reusable_widget/app_bar.dart';
import 'masalah_category_item_widget.dart';

class MasalahCategoryListPage extends StatefulWidget {
  @override
  _MasalahCategoryListPageState createState() =>
      _MasalahCategoryListPageState();
}

class _MasalahCategoryListPageState extends State<MasalahCategoryListPage> {
  final _searchController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

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
    print("hello build");
    return Scaffold(
      appBar: AppTopBar(
        title: "Masalah Categories",
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
                    hintText: "Search category here",
                    fillColor: Colors.white70),
              ),
            ),
            FutureBuilder(
              future: _searchController.text != ""
                  ? dbHelper.queryAllCategoryRows(_searchController.text)
                  : dbHelper.getCategoryRows(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<MasalahCategoryModel>> snapshot) {
                print("@@@@@");
                print(snapshot.connectionState);
                if (snapshot.data!.length != 0) {
                  print("hello thisis ");
                  List<MasalahCategoryModel> categories = snapshot.data!;
                  return categories.length != 0
                      ? Column(
                          children: [
                            ...List.generate(
                              categories.length,
                              (index) {
                                if (categories[index].masalahCount != 0)
                                  return MasalahCategoryItem(
                                      category: categories[index]);

                                return SizedBox
                                    .shrink(); // here by default width and height is 0
                              },
                            ),
                          ],
                        )
                      : Center(child: Text('hi'));
                } else {
                  print("con");
                  return Container();
                }
              },
            ),

            // BlocBuilder<MasalahCategoryListBloc, MasalahCategoryListState>(
            //     builder: (context, state) {
            //   print("****");
            //   print(state.toString());

            //   if (state is MasalahCategoryListLoaded) {
            //     return ListView.builder(
            //         itemCount: state.masalahs.length,
            //         itemBuilder: (BuildContext context, int position) {
            //           return MasalahCategoryItem(
            //               category: state.masalahs[position]);
            //         });
            //   }
            //   if (state is MasalahCategoryListError) {
            //     return Text('hi');
            //   }

            //   return Container();
            // })

            //
          ],
        ),
      ),
    );
  }
}
