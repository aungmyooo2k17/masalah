import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/domain/entities/masalah_category_entity.dart';
import 'package:masalah/presentation/journeys/masalah/masalah_list_page.dart';
import 'package:masalah/reusable_widget/app_text.dart';

class MasalahCategoryItem extends StatelessWidget {
  final MasalahCategoryEntity category;
  const MasalahCategoryItem({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MasalahListPage(
                  category: category,
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
              data: category.categoryName,
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
