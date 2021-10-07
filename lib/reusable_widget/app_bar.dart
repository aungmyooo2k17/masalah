import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/reusable_widget/app_text.dart';
import 'package:masalah/screens/setting_screen.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(54);

  const AppTopBar(
      {Key? key,
      this.title = "",
      this.bgColor = Colors.white,
      this.textColor = Colors.black,
      this.enableBackBtn = false})
      : super(key: key);

  final String title;
  final Color bgColor;
  final Color textColor;
  final bool enableBackBtn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: AppColors.primaryText, //change your color here
      ),
      automaticallyImplyLeading: enableBackBtn,
      elevation: 0,
      backgroundColor: bgColor,
      titleTextStyle: TextStyle(fontSize: 26),
      title: BoldText(
        data: title,
        color: textColor,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: AppColors.primaryText,
          ),
          tooltip: 'Setting',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingScreen()));
          },
        ),
      ],
    );
  }
}
