import 'package:flutter/material.dart';
import 'package:masalah/presentation/screens/main/main_screen.dart';
import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../network/remote_data_source.dart';
import '../../reusable_widget/app_bar.dart';
import './gold_form.dart';
import './header_widget.dart';
import './platinum_form.dart';
import './silver_form.dart';
import '../../../common/extensions/string_extensions.dart';
import './money_form.dart';
import './animal_form.dart';
import './property_form.dart';
import './owe_form.dart';
import './result_page.dart';
import './dollar_price_form.dart';

class ZCScreen extends StatefulWidget {
  const ZCScreen({Key? key}) : super(key: key);

  @override
  State<ZCScreen> createState() => _ZCScreenState();
}

class _ZCScreenState extends State<ZCScreen> {
  final RemoteDataSource _apiResponse = RemoteDataSource();

  @override
  void initState() {
    _apiResponse.getRates();
    super.initState();
  }

  final ScrollController _controller = ScrollController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        enableBackBtn: true,
        title: TranslationConstants.zakatCalculator.t(context) ?? "",
        bgColor: AppColors.bgColor,
        textColor: AppColors.primaryText,
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            ZCHeader(step: currentIndex),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  currentForm(currentIndex),
                  SizedBox(
                    height: 42.0,
                  ),
                  nextBtns(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget currentForm(idx) {
    switch (idx) {
      case 0:
        return GoldForm();
      case 1:
        return PlatinumForm();
      case 2:
        return SilverForm();
      case 3:
        return MoneyForm();
      case 4:
        return PropertyForm();
      case 5:
        return AnimalForm();
      case 6:
        return OweForm();
      case 7:
        return DollarPriceForm();
      case 8:
        return ResultPage();
      default:
        return GoldForm();
    }
  }

  Widget nextBtns(ctx) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(
            margin: EdgeInsets.only(right: 4.0),
            width: 1000.0,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryText),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: Text(TranslationConstants.previous.t(ctx) ?? ""),
              onPressed: onPrevious,
            ),
          ),
          flex: 1,
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 4.0),
            width: 1000.0,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryText),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: Text(TranslationConstants.next.t(ctx) ?? ""),
              onPressed: onNext,
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }

  onNext() {
    setState(() {
      if (currentIndex != 8) {
        currentIndex++;
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainScreen()),
            (Route<dynamic> route) => false);
      }
    });
    scrollUp();
  }

  onPrevious() {
    setState(() {
      if (currentIndex != 0) {
        currentIndex--;
      }
    });
    scrollUp();
  }

  scrollUp() {
    _controller.animateTo(
        //go to top of scroll
        0, //scroll offset to go
        duration: Duration(milliseconds: 500), //duration of scroll
        curve: Curves.fastOutSlowIn //scroll type
        );
  }
}
