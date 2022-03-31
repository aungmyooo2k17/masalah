import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masalah/common/constants/size_constants.dart';
import 'package:masalah/common/extensions/size_extensions.dart';

import 'app_color.dart';

class ThemeText {
  const ThemeText._();

  //1
  static TextTheme get _poppinsTextTheme => GoogleFonts.robotoTextTheme();
  //2
  static TextStyle? get _whiteHeadline6 =>
      _poppinsTextTheme.headline6?.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: AppColor.primary,
        overflow: TextOverflow.ellipsis,
        fontFamily: 'Unicode',
      );
  //3

  //1
  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1!.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: AppColor.primary,
        overflow: TextOverflow.ellipsis,
        fontFamily: 'Unicode',
      );

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
        color: AppColor.primary,
        fontSize: Sizes.dimen_14.sp,
        wordSpacing: 0.25,
        overflow: TextOverflow.ellipsis,
        letterSpacing: 0.25,
        height: 1.5,
        fontFamily: 'Unicode',
      );

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        //3
        subtitle1: whiteSubtitle1,
        bodyText2: whiteBodyText2,
      );
}

//1
extension ThemeTextExtension on TextTheme {
  //2
  TextStyle get royalBlueSubtitle1 => subtitle1!.copyWith(
        color: AppColor.primary,
        fontWeight: FontWeight.w600,
      );
}
