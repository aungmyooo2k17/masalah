import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:masalah/common/constants/color_constant.dart';

class MasalahDetailHeader extends StatelessWidget {

  final String title;
  final VoidCallback onBackPressed;
  final VoidCallback onNavigateToSetting;
  
  const MasalahDetailHeader({Key? key,required this.title,required this.onBackPressed,required this.onNavigateToSetting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryText,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              IconButton(onPressed: onBackPressed, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
              IconButton(onPressed: onNavigateToSetting, icon: Icon(Icons.settings,color: Colors.white,))
             ],
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Text(title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),),
          )
        ],
      ),
    );
  }
}