import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/data/data_sources/masalah_local_data_source.dart';
import 'package:masalah/domain/entities/masalah_category_entity.dart';
import 'package:masalah/presentation/journeys/masalah/masalah_detail_page.dart';
import 'package:masalah/presentation/journeys/masalah/masalah_item_widget.dart';

import '../../../data/models/masalah_model.dart';
import '../../../reusable_widget/app_bar.dart';

class MasalahListPage extends StatefulWidget {
  late final MasalahCategoryEntity category;

  MasalahListPage({required this.category});
  @override
  _MasalahListPageState createState() => _MasalahListPageState();
}

class _MasalahListPageState extends State<MasalahListPage> {
  final dbHelper = DatabaseHelper.instance;

  final _searchController = TextEditingController();
  int masCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: widget.category.categoryName,
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
              future: _searchController.text != ""
                  ? dbHelper.queryAllMasalahRowsByCategoryId(
                      _searchController.text, widget.category.categoryId)
                  : dbHelper
                      .getMasalahRowsByCategoryId(widget.category.categoryId),
              builder: (BuildContext context,
                  AsyncSnapshot<List<MasalahModel>> snapshot) {
                if (snapshot.data!.length != 0) {
                  List<MasalahModel> masalahs = snapshot.data!;
                  return masalahs.length != 0
                      ? Column(
                          children: [
                            ...List.generate(
                              masalahs.length,
                              (index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MasalahDetailPage(
                                                      masalah:
                                                          masalahs[index])));
                                    },
                                    child: MasalahItem(masalahs[index]));
                              },
                            ),
                          ],
                        )
                      : Center(child: Text('hi'));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
