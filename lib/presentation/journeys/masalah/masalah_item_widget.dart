import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/data/models/masalah_model.dart';
import 'package:masalah/domain/entities/masalah_entity.dart';
import 'package:masalah/presentation/themes/theme_text.dart';

class MasalahItem extends StatelessWidget {
  final MasalahModel mData;

  MasalahItem(this.mData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  mData.masalahTitle,
                  style: ThemeText.whiteSubtitle1,
                ),
              ),
              Icon(
                Icons.arrow_forward_outlined,
                size: 18.0,
                color: AppColors.secondaryText,
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            mData.masalahDescription,
            style: ThemeText.whiteBodyText2,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}
