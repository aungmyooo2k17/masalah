import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/app_text.dart';

class SettingScreen extends StatelessWidget {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppTopBar(
          enableBackBtn: true,
          title: "Setting",
          bgColor: AppColors.bgColor,
          textColor: AppColors.primaryText,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  buildLanguageDialog(context);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('title'.tr),
                      BoldText(
                        color: AppColors.primaryText,
                        fontSize: 16.0,
                        data: "Zakat Calculator",
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 18.0,
                        color: AppColors.secondaryText,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }
}
