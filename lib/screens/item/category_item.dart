import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/category.dart';
import 'package:masalah/reusable_widget/app_text.dart';
import 'package:masalah/screens/masalah_list_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MasalahListScreen(
                  categoryName: category.categoryName,
                  categoryId: category.categoryId,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoldText(
              color: AppColors.primaryText,
              fontSize: 16.0,
              data: category.categoryName!,
            ),
            Icon(
              Icons.arrow_forward_outlined,
              size: 18.0,
              color: AppColors.secondaryText,
            )
          ],
        ),
      ),
    );
  }
}
