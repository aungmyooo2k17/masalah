import 'package:flutter/material.dart';

import '../../../common/constants/color_constant.dart';
import '../../reusable_widget/app_text.dart';

class ToolItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const ToolItem({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),
            BoldText(
              color: AppColors.primaryText,
              data: title,
              fontSize: 18.0,
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Icon(
            //     Icons.arrow_forward_ios,
            //     color: AppColors.white,
            //     size: 12.0,
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     shape: CircleBorder(),
            //     backgroundColor: AppColors.primaryText, // <-- Button color
            //     foregroundColor: AppColors.secondaryText, // <-- Splash color
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
