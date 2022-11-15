// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:masalah/common/constants/color_constant.dart';
// import 'package:masalah/common/extensions/string_extensions.dart';
// import 'package:masalah/db/db_helper.dart';
// import 'package:masalah/network/remote_data_source.dart';
// import 'package:masalah/presentation/reusable_widget/app_text.dart';
// import 'package:masalah/util/zakat_calculator_util.dart';

// import '../../../common/constants/translation_constants.dart';
// import 'zakat_list_screen.dart';

// class ZakatCalculator extends StatefulWidget {
//   @override
//   _ZakatCalculatorState createState() => _ZakatCalculatorState();
// }

// class _ZakatCalculatorState extends State<ZakatCalculator> {
//   GlobalKey _globalKey = new GlobalKey();
//   int _currentStep = 0;
//   StepperType stepperType = StepperType.vertical;
//   final dbHelper = DatabaseHelper.instance;

//   late Map<String, String> _result = {"result": "", "netWorth": ""};
//   String _resultSateThoe = "";
//   String _resultKywaeNwar = "";
//   String _resultKalaout = "";
//   bool _optionAuto = true;

//   final goldAkhoutKyatthar = TextEditingController();
//   final goldAkhoutPae = TextEditingController();
//   final goldAkhoutYwae = TextEditingController();
//   final goldAhtaeKyatthar = TextEditingController();
//   final goldAhtaePae = TextEditingController();
//   final goldAhtaeYwae = TextEditingController();
//   final goldPyitceeKyatthar = TextEditingController();
//   final goldPyitceePae = TextEditingController();
//   final goldPyitceeYwae = TextEditingController();

//   final whiteSilverAkhoutKyatthar = TextEditingController();
//   final whiteSilverAkhoutPae = TextEditingController();
//   final whiteSilverAkhoutYwae = TextEditingController();
//   final whiteSilverAhtaeKyatthar = TextEditingController();
//   final whiteSilverAhtaePae = TextEditingController();
//   final whiteSilverAhtaeYwae = TextEditingController();
//   final whiteSilverPyitceeKyatthar = TextEditingController();
//   final whiteSilverPyitceePae = TextEditingController();
//   final whiteSilverPyitceeYwae = TextEditingController();

//   final silverAkhoutKyatthar = TextEditingController();
//   final silverAkhoutPae = TextEditingController();
//   final silverAkhoutYwae = TextEditingController();
//   final silverAhtaeKyatthar = TextEditingController();
//   final silverAhtaePae = TextEditingController();
//   final silverAhtaeYwae = TextEditingController();
//   final silverPyitceeKyatthar = TextEditingController();
//   final silverPyitceePae = TextEditingController();
//   final silverPyitceeYwae = TextEditingController();

//   final inHandSuHtarTaw = TextEditingController();
//   final inHandPyitceeSold = TextEditingController();
//   final inHandPyitceeBorrow = TextEditingController();
//   final inHandForeignCurrency = TextEditingController();
//   final inHandContract = TextEditingController();
//   final inHandOther = TextEditingController();

//   final inBankInBank = TextEditingController();
//   final inBankThuMyarHlwae = TextEditingController();
//   final inBankSalary = TextEditingController();
//   final inBankOther = TextEditingController();

//   final thuMyarDebtPyitceeSold = TextEditingController();
//   final thuMyarDebtChayPay = TextEditingController();
//   final thuMyarDebtAttHtrTaw = TextEditingController();
//   final thuMyarDebtOther = TextEditingController();

//   final realEstateSellHouse = TextEditingController();
//   final realEstateSellEscort = TextEditingController();
//   final realEstateSellCar = TextEditingController();
//   final realEstateOther = TextEditingController();

//   final rawWearhouse = TextEditingController();
//   final rawHome = TextEditingController();
//   final rawShop = TextEditingController();
//   final rawOther = TextEditingController();

//   final finishWearhouse = TextEditingController();
//   final finishHome = TextEditingController();
//   final finishShop = TextEditingController();
//   final finishAnimal = TextEditingController();
//   final finishOther = TextEditingController();

//   final minusDebtMahur = TextEditingController();
//   final minusDebt = TextEditingController();
//   final minusSukyae = TextEditingController();
//   final minusMeterBill = TextEditingController();
//   final minusPaybill = TextEditingController();
//   final minusPaySalary = TextEditingController();
//   final minusPayRent = TextEditingController();
//   final minusBuyGoodPay = TextEditingController();
//   final minusPreZakat = TextEditingController();

//   final kalaout = TextEditingController();
//   final kywae = TextEditingController();
//   final nwar = TextEditingController();
//   final sate = TextEditingController();
//   final thoe = TextEditingController();

//   final goldPrice = TextEditingController();
//   final silverPrice = TextEditingController();

//   final RemoteDataSource _apiResponse = RemoteDataSource();

//   double goldRate = 0.0;
//   double silverRate = 0.0;
//   double usdRate = 0.0;

//   @override
//   void initState() {
//     _apiResponse.getUSDRate().then((value) {
//       print("usdddd");
//       print(value);
//       value = value.replaceAll(',', '');
//       usdRate = double.parse(value);
//     });
//     _apiResponse.getGoldRate().then((value) => {goldRate = value});
//     _apiResponse.getSilverRate().then((value) => {silverRate = value});

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: AppColors.primaryText, //change your color here
//         ),
//         automaticallyImplyLeading: true,
//         elevation: 0,
//         backgroundColor: AppColors.bgColor,
//         titleTextStyle: TextStyle(fontSize: 26),
//         title: BoldText(
//           data: TranslationConstants.zakatCalculator.t(context) ?? "",
//           color: AppColors.primaryText,
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.more_vert,
//               color: AppColors.primaryText,
//             ),
//             tooltip: 'More',
//             onPressed: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => ZakatListScreen()));
//             },
//           ),
//         ],
//       ),
//       body: Stepper(
//         type: StepperType.horizontal,
//         physics: ScrollPhysics(),
//         currentStep: _currentStep,
//         // onStepTapped: (step) => tapped(step),
//         onStepContinue: continued,
//         onStepCancel: cancel,
//         controlsBuilder: (BuildContext context, ControlsDetails details) {
//           return Row(
//             children: <Widget>[
//               Flexible(
//                 child: Container(
//                   margin: EdgeInsets.only(right: 4.0),
//                   width: 1000.0,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(AppColors.primaryText),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                     ),
//                     child: Text(TranslationConstants.previous.t(context) ?? ""),
//                     onPressed: details.onStepCancel,
//                   ),
//                 ),
//                 flex: 1,
//               ),
//               Flexible(
//                 child: Container(
//                   margin: EdgeInsets.only(left: 4.0),
//                   width: 1000.0,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(AppColors.primaryText),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                     ),
//                     child: Text(TranslationConstants.next.t(context) ?? ""),
//                     onPressed: details.onStepContinue,
//                   ),
//                 ),
//                 flex: 1,
//               ),
//             ],
//           );
//         },
//         steps: <Step>[
//           Step(
//             title: RegularText(
//               data: _currentStep == 0 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BoldText(
//                   data: TranslationConstants.gold.t(context) ?? "",
//                   color: AppColors.primaryText,
//                   fontSize: 22.0,
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryText,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RegularText(
//                         fontSize: 14,
//                         color: AppColors.white,
//                         data: TranslationConstants.goldDescription.t(context) ??
//                             "",
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.akhout.t(context) ?? "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldAkhoutKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldAkhoutPae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldAkhoutYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(height: 16.0),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.ahtae.t(context) ?? "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldAhtaeKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldAhtaePae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldAhtaeYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(height: 16.0),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.atoneAsungPyitcee
//                                   .t(context) ??
//                               "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldPyitceeKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldPyitceePae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: goldPyitceeYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(height: 24.0),
//               ],
//             ),
//             isActive: _currentStep >= 0,
//             state: _currentStep >= 0 ? StepState.complete : StepState.indexed,
//           ),
//           Step(
//             title: RegularText(
//               data: _currentStep == 1 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BoldText(
//                   data: TranslationConstants.platinum.t(context) ?? "",
//                   color: AppColors.primaryText,
//                   fontSize: 22.0,
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryText,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RegularText(
//                         fontSize: 14,
//                         color: AppColors.white,
//                         data: TranslationConstants.platinumDescription
//                                 .t(context) ??
//                             "",
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.akhout.t(context) ?? "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: whiteSilverAkhoutKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: whiteSilverAkhoutPae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: whiteSilverAkhoutYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(height: 16.0),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.ahtae.t(context) ?? "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: whiteSilverAhtaeKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: whiteSilverAhtaePae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: whiteSilverAhtaeYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(height: 16.0),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.atoneAsungPyitcee
//                                   .t(context) ??
//                               "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller:
//                                               whiteSilverPyitceeKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: whiteSilverPyitceePae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: whiteSilverPyitceeYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//               ],
//             ),
//             isActive: _currentStep >= 1,
//             state: _currentStep >= 1 ? StepState.complete : StepState.indexed,
//           ),
//           Step(
//             title: RegularText(
//               data: _currentStep == 2 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BoldText(
//                   data: TranslationConstants.silver.t(context) ?? "",
//                   color: AppColors.primaryText,
//                   fontSize: 22.0,
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryText,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RegularText(
//                         fontSize: 14,
//                         color: AppColors.white,
//                         data:
//                             TranslationConstants.silverDescription.t(context) ??
//                                 "",
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.akhout.t(context) ?? "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverAkhoutKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverAkhoutPae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverAkhoutYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(height: 16.0),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.ahtae.t(context) ?? "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverAhtaeKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverAhtaePae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverAhtaeYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(height: 16.0),
//                 Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BoldText(
//                           data: TranslationConstants.atoneAsungPyitcee
//                                   .t(context) ??
//                               "",
//                           color: AppColors.primaryText,
//                         ),
//                         SizedBox(
//                           height: 16.0,
//                         ),
//                         new Row(
//                           children: <Widget>[
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants
//                                                       .kyatthar
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverPyitceeKyatthar,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.pae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverPyitceePae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                             new Flexible(
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.primaryText,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(8.0),
//                                               topLeft: Radius.circular(8.0)),
//                                         ),
//                                         child: Center(
//                                           child: RegularText(
//                                               data: TranslationConstants.ywae
//                                                       .t(context) ??
//                                                   "",
//                                               fontSize: 10.0,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 8.0),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.white,
//                                           border: Border.all(
//                                               color: Colors.black12, width: 1),
//                                         ),
//                                         child: TextField(
//                                           controller: silverPyitceeYwae,
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               contentPadding: EdgeInsets.only(
//                                                 bottom: 30 /
//                                                     2, // HERE THE IMPORTANT PART
//                                               )),
//                                           style: TextStyle(
//                                             height: 0.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//               ],
//             ),
//             isActive: _currentStep >= 2,
//             state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
//           ),
//           Step(
//             title: RegularText(
//               data: _currentStep == 3 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryText,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         fontSize: 14,
//                         color: AppColors.white,
//                         data:
//                             TranslationConstants.moneyDescription.t(context) ??
//                                 "",
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.inHand.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         controller: inHandSuHtarTaw,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           labelText:
//                               TranslationConstants.inHandSuHtarTaw.t(context) ??
//                                   "",
//                         ),
//                       ),
//                       TextFormField(
//                         controller: inHandPyitceeSold,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText: TranslationConstants.inHandPyitceeSold
//                                     .t(context) ??
//                                 ""),
//                       ),
//                       TextFormField(
//                           controller: inHandPyitceeBorrow,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants
//                                       .inHandPyitceeBorrow
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: inHandForeignCurrency,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants
//                                       .inHandForeignCurrency
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: inHandContract,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.inHandContract
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: inHandOther,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.others.t(context) ??
//                                       "")),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.inBank.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         controller: inBankInBank,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.inBankInBank.t(context) ??
//                                     ""),
//                       ),
//                       TextFormField(
//                         controller: inBankThuMyarHlwae,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText: TranslationConstants.inBankThuMyarHlwae
//                                     .t(context) ??
//                                 ""),
//                       ),
//                       TextFormField(
//                           controller: inBankSalary,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.inBankSalary
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: inBankOther,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.inBankOther.t(context) ??
//                                       "")),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.thuMyarDebt.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         controller: thuMyarDebtPyitceeSold,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText: TranslationConstants
//                                     .thuMyarDebtPyitceeSold
//                                     .t(context) ??
//                                 ""),
//                       ),
//                       TextFormField(
//                         controller: thuMyarDebtChayPay,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText: TranslationConstants.thuMyarDebtChayPay
//                                     .t(context) ??
//                                 ""),
//                       ),
//                       TextFormField(
//                           controller: thuMyarDebtAttHtrTaw,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants
//                                       .thuMyarDebtAttHtrTaw
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: thuMyarDebtOther,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.others.t(context) ??
//                                       "")),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//               ],
//             ),
//             isActive: _currentStep >= 3,
//             state: _currentStep >= 3 ? StepState.complete : StepState.indexed,
//           ),
//           Step(
//             title: RegularText(
//               data: _currentStep == 4 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryText,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         fontSize: 14,
//                         color: AppColors.white,
//                         data:
//                             TranslationConstants.goodsDescription.t(context) ??
//                                 "",
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.realEstate.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         controller: realEstateSellHouse,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText: TranslationConstants.realEstateSellHouse
//                                     .t(context) ??
//                                 ""),
//                       ),
//                       TextFormField(
//                         controller: realEstateSellEscort,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText: TranslationConstants.realEstateSellEscort
//                                     .t(context) ??
//                                 ""),
//                       ),
//                       TextFormField(
//                           controller: realEstateSellCar,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.realEstateSellCar
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: realEstateOther,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.others.t(context) ??
//                                       "")),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.raw.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         controller: rawWearhouse,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.rawWearhouse.t(context) ??
//                                     ""),
//                       ),
//                       TextFormField(
//                         controller: rawHome,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.rawHome.t(context) ?? ""),
//                       ),
//                       TextFormField(
//                           controller: rawShop,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.rawShop.t(context) ??
//                                       "")),
//                       TextFormField(
//                           controller: rawOther,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.others.t(context) ??
//                                       "")),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.goods.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         controller: finishWearhouse,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText: TranslationConstants.finishWearhouse
//                                     .t(context) ??
//                                 ""),
//                       ),
//                       TextFormField(
//                         controller: finishHome,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.finishHome.t(context) ??
//                                     ""),
//                       ),
//                       TextFormField(
//                           controller: finishShop,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.finishShop.t(context) ??
//                                       "")),
//                       TextFormField(
//                           controller: finishAnimal,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.finishAnimal
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: finishOther,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.others.t(context) ??
//                                       "")),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//               ],
//             ),
//             isActive: _currentStep >= 4,
//             state: _currentStep >= 4 ? StepState.complete : StepState.indexed,
//           ),
//           Step(
//             title: RegularText(
//               data: _currentStep == 5 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryText,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         fontSize: 14,
//                         color: AppColors.white,
//                         data:
//                             TranslationConstants.animalDescription.t(context) ??
//                                 "",
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.kalaout.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.number,
//                         controller: kalaout,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.kalaout.t(context) ?? ""),
//                       ),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.kywaenwar.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.number,
//                         controller: kywae,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.kywae.t(context) ?? ""),
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.number,
//                         controller: nwar,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.nwar.t(context) ?? ""),
//                       ),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BoldText(
//                         data: TranslationConstants.satethoe.t(context) ?? "",
//                         color: AppColors.primaryText,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.number,
//                         controller: sate,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.sate.t(context) ?? ""),
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.number,
//                         controller: thoe,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.thoe.t(context) ?? ""),
//                       ),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//               ],
//             ),
//             isActive: _currentStep >= 5,
//             state: _currentStep >= 5 ? StepState.complete : StepState.indexed,
//           ),
//           Step(
//             title: RegularText(
//               data: _currentStep == 6 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: Column(
//               children: [
//                 // Container(
//                 //   padding: EdgeInsets.all(16),
//                 //   decoration: BoxDecoration(
//                 //     color: AppColors.bgBtn,
//                 //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 //   ),
//                 //   child: Column(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: [

//                 //       BoldText(
//                 //         fontSize: 14,
//                 //         color: AppColors.white,
//                 //         data:
//                 //             "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextFormField(
//                         controller: minusDebtMahur,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText: TranslationConstants.minusDebtMahur
//                                     .t(context) ??
//                                 ""),
//                       ),
//                       TextFormField(
//                         controller: minusDebt,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             labelText:
//                                 TranslationConstants.minusDebt.t(context) ??
//                                     ""),
//                       ),
//                       TextFormField(
//                           controller: minusSukyae,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText:
//                                   TranslationConstants.minusSukyae.t(context) ??
//                                       "")),
//                       TextFormField(
//                           controller: minusMeterBill,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.minusMeterBill
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: minusPaybill,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.minusPaybill
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: minusPaySalary,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.minusPaySalary
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: minusPayRent,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.minusPayRent
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: minusBuyGoodPay,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.minusBuyGoodPay
//                                       .t(context) ??
//                                   "")),
//                       TextFormField(
//                           controller: minusPreZakat,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               labelText: TranslationConstants.minusPreZakat
//                                       .t(context) ??
//                                   "")),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//               ],
//             ),
//             isActive: _currentStep >= 6,
//             state: _currentStep >= 6 ? StepState.complete : StepState.indexed,
//           ),
//           Step(
//             title: RegularText(
//               data: _currentStep == 7 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     RegularText(
//                       data: TranslationConstants.manual.t(context) ?? "",
//                       color: AppColors.primaryText,
//                     ),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     CupertinoSwitch(
//                       value: _optionAuto,
//                       onChanged: (value) {
//                         setState(() {
//                           _optionAuto = value;
//                         });
//                       },
//                     ),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     RegularText(
//                       data: TranslationConstants.auto.t(context) ?? "",
//                       color: AppColors.primaryText,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 !_optionAuto
//                     ? Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8.0)),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 BoldText(
//                                   data: "ရွှေဈေးစုံစမ်း၍ထည့်ရန်",
//                                   color: AppColors.primaryText,
//                                 ),
//                                 TextFormField(
//                                   controller: goldPrice,
//                                   keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(labelText: ' '),
//                                 ),
//                                 SizedBox(
//                                   height: 8.0,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 24.0,
//                           ),
//                           Container(
//                             padding: EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8.0)),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 BoldText(
//                                   data: "ငွေဈေးစုံစမ်း၍ထည့်ရန်",
//                                   color: AppColors.primaryText,
//                                 ),
//                                 TextFormField(
//                                   controller: silverPrice,
//                                   keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(labelText: ' '),
//                                 ),
//                                 SizedBox(
//                                   height: 8.0,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 24.0,
//                           ),
//                         ],
//                       )
//                     : Column(
//                         children: [
//                           Row(
//                             children: [
//                               RegularText(
//                                 data:
//                                     TranslationConstants.goldRate.t(context) ??
//                                         "",
//                               ),
//                               SizedBox(
//                                 width: 16,
//                               ),
//                               BoldText(
//                                 data: ZakatCalculatorUtil()
//                                     .getRate(goldRate, usdRate)
//                                     .toString(),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             children: [
//                               RegularText(
//                                 data: TranslationConstants.silverRate
//                                         .t(context) ??
//                                     "",
//                               ),
//                               SizedBox(
//                                 width: 16,
//                               ),
//                               BoldText(
//                                 data: ZakatCalculatorUtil()
//                                     .getRate(silverRate, usdRate)
//                                     .toString(),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//               ],
//             ),
//             isActive: _currentStep >= 7,
//             state: _currentStep >= 7 ? StepState.complete : StepState.indexed,
//           ),
//           Step(
//             title: RegularText(
//               data: _currentStep == 8 ? '' : '',
//               fontSize: 14.0,
//               color: Colors.black87,
//             ),
//             content: RepaintBoundary(
//               key: _globalKey,
//               child: Container(
//                 margin: EdgeInsets.only(bottom: 28),
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//                 child: Column(
//                   children: [
//                     RegularText(
//                       data: "ထိုက်သောဇကားသ်",
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     BoldText(
//                       data: _result['result']! +
//                           "\n" +
//                           _resultKalaout +
//                           "\n" +
//                           _resultKywaeNwar +
//                           "\n" +
//                           _resultSateThoe,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             isActive: _currentStep >= 8,
//             state: _currentStep >= 8 ? StepState.complete : StepState.indexed,
//           ),
//         ],
//       ),
//     );
//   }

//   switchStepsType() {
//     setState(() => stepperType == StepperType.vertical
//         ? stepperType = StepperType.horizontal
//         : stepperType = StepperType.vertical);
//   }

//   tapped(int step) {
//     setState(() => _currentStep = step);
//   }

//   continued() {
//     final isLastStep = _currentStep == 8;

//     if (isLastStep) {
//       // logic here;
//     }

//     if (_currentStep == 7) {
//       if (_optionAuto) {
//         goldPrice.text =
//             ZakatCalculatorUtil().getRate(goldRate, usdRate).toString();
//         silverPrice.text =
//             ZakatCalculatorUtil().getRate(silverRate, usdRate).toString();
//       } else {}
//       setState(() {
//         // _result = ZakatCalculatorUtil().calcFinalZakatAmount(
//         //     ZakatCalculatorUtil().getTotalGoldPlatinum(
//         //       double.parse(goldPrice.text == '' ? '0.0' : goldPrice.text),
//         //       double.parse(goldAkhoutKyatthar.text == ''
//         //           ? '0.0'
//         //           : goldAkhoutKyatthar.text),
//         //       double.parse(
//         //           goldAkhoutPae.text == '' ? '0.0' : goldAkhoutPae.text),
//         //       double.parse(
//         //           goldAkhoutYwae.text == '' ? '0.0' : goldAkhoutYwae.text),
//         //       double.parse(goldAhtaeKyatthar.text == ''
//         //           ? '0.0'
//         //           : goldAhtaeKyatthar.text),
//         //       double.parse(goldAhtaePae.text == '' ? '0.0' : goldAhtaePae.text),
//         //       double.parse(
//         //           goldAhtaeYwae.text == '' ? '0.0' : goldAhtaeYwae.text),
//         //       double.parse(goldPyitceeKyatthar.text == ''
//         //           ? '0.0'
//         //           : goldPyitceeKyatthar.text),
//         //       double.parse(
//         //           goldPyitceePae.text == '' ? '0.0' : goldPyitceePae.text),
//         //       double.parse(
//         //           goldPyitceeYwae.text == '' ? '0.0' : goldPyitceeYwae.text),
//         //       double.parse(whiteSilverAkhoutKyatthar.text == ''
//         //           ? '0.0'
//         //           : whiteSilverAkhoutKyatthar.text),
//         //       double.parse(whiteSilverAkhoutPae.text == ''
//         //           ? '0.0'
//         //           : whiteSilverAkhoutPae.text),
//         //       double.parse(whiteSilverAkhoutYwae.text == ''
//         //           ? '0.0'
//         //           : whiteSilverAkhoutYwae.text),
//         //       double.parse(whiteSilverAhtaeKyatthar.text == ''
//         //           ? '0.0'
//         //           : whiteSilverAhtaeKyatthar.text),
//         //       double.parse(whiteSilverAhtaePae.text == ''
//         //           ? '0.0'
//         //           : whiteSilverAhtaePae.text),
//         //       double.parse(whiteSilverAhtaeYwae.text == ''
//         //           ? '0.0'
//         //           : whiteSilverAhtaeYwae.text),
//         //       double.parse(whiteSilverPyitceeKyatthar.text == ''
//         //           ? '0.0'
//         //           : whiteSilverPyitceeKyatthar.text),
//         //       double.parse(whiteSilverPyitceePae.text == ''
//         //           ? '0.0'
//         //           : whiteSilverPyitceePae.text),
//         //       double.parse(whiteSilverPyitceeYwae.text == ''
//         //           ? '0.0'
//         //           : whiteSilverPyitceeYwae.text),
//         //     ),
//         //     ZakatCalculatorUtil().getTotalSilverMoneyOther(
//         //         double.parse(silverPrice.text == '' ? '0.0' : silverPrice.text),
//         //         double.parse(silverAkhoutKyatthar.text == ''
//         //             ? '0.0'
//         //             : silverAkhoutKyatthar.text),
//         //         double.parse(
//         //             silverAkhoutPae.text == '' ? '0.0' : silverAkhoutPae.text),
//         //         double.parse(silverAkhoutYwae.text == ''
//         //             ? '0.0'
//         //             : silverAkhoutYwae.text),
//         //         double.parse(silverAhtaeKyatthar.text == ''
//         //             ? '0.0'
//         //             : silverAhtaeKyatthar.text),
//         //         double.parse(
//         //             silverAhtaePae.text == '' ? '0.0' : silverAhtaePae.text),
//         //         double.parse(
//         //             silverAhtaeYwae.text == '' ? '0.0' : silverAhtaeYwae.text),
//         //         double.parse(silverPyitceeKyatthar.text == ''
//         //             ? '0.0'
//         //             : silverPyitceeKyatthar.text),
//         //         double.parse(silverPyitceePae.text == ''
//         //             ? '0.0'
//         //             : silverPyitceePae.text),
//         //         double.parse(silverPyitceeYwae.text == ''
//         //             ? '0.0'
//         //             : silverPyitceeYwae.text),
//         //         double.parse(
//         //             inHandSuHtarTaw.text == '' ? '0.0' : inHandSuHtarTaw.text),
//         //         double.parse(inHandPyitceeSold.text == ''
//         //             ? '0.0'
//         //             : inHandPyitceeSold.text),
//         //         double.parse(inHandPyitceeBorrow.text == ''
//         //             ? '0.0'
//         //             : inHandPyitceeBorrow.text),
//         //         double.parse(inHandForeignCurrency.text == ''
//         //             ? '0.0'
//         //             : inHandForeignCurrency.text),
//         //         double.parse(
//         //             inHandContract.text == '' ? '0.0' : inHandContract.text),
//         //         double.parse(inHandOther.text == '' ? '0.0' : inHandOther.text),
//         //         double.parse(
//         //             inBankInBank.text == '' ? '0.0' : inBankInBank.text),
//         //         double.parse(inBankThuMyarHlwae.text == ''
//         //             ? '0.0'
//         //             : inBankThuMyarHlwae.text),
//         //         double.parse(
//         //             inBankSalary.text == '' ? '0.0' : inBankSalary.text),
//         //         double.parse(inBankOther.text == '' ? '0.0' : inBankOther.text),
//         //         double.parse(thuMyarDebtPyitceeSold.text == ''
//         //             ? '0.0'
//         //             : thuMyarDebtPyitceeSold.text),
//         //         double.parse(thuMyarDebtChayPay.text == ''
//         //             ? '0.0'
//         //             : thuMyarDebtChayPay.text),
//         //         double.parse(thuMyarDebtAttHtrTaw.text == '' ? '0.0' : thuMyarDebtAttHtrTaw.text),
//         //         double.parse(thuMyarDebtOther.text == '' ? '0.0' : thuMyarDebtOther.text),
//         //         double.parse(realEstateSellHouse.text == '' ? '0.0' : realEstateSellHouse.text),
//         //         double.parse(realEstateSellEscort.text == '' ? '0.0' : realEstateSellEscort.text),
//         //         double.parse(realEstateSellCar.text == '' ? '0.0' : realEstateSellCar.text),
//         //         double.parse(realEstateOther.text == '' ? '0.0' : realEstateOther.text),
//         //         double.parse(rawWearhouse.text == '' ? '0.0' : rawWearhouse.text),
//         //         double.parse(rawHome.text == '' ? '0.0' : rawHome.text),
//         //         double.parse(rawShop.text == '' ? '0.0' : rawShop.text),
//         //         double.parse(rawOther.text == '' ? '0.0' : rawOther.text),
//         //         double.parse(finishWearhouse.text == '' ? '0.0' : finishWearhouse.text),
//         //         double.parse(finishHome.text == '' ? '0.0' : finishHome.text),
//         //         double.parse(finishShop.text == '' ? '0.0' : finishShop.text),
//         //         double.parse(finishAnimal.text == '' ? '0.0' : finishAnimal.text),
//         //         double.parse(finishOther.text == '' ? '0.0' : finishOther.text)),
//         //     ZakatCalculatorUtil().getTotalMinus(double.parse(minusDebtMahur.text == '' ? '0.0' : minusDebtMahur.text), double.parse(minusDebt.text == '' ? '0.0' : minusDebt.text), double.parse(minusSukyae.text == '' ? '0.0' : minusSukyae.text), double.parse(minusMeterBill.text == '' ? '0.0' : minusMeterBill.text), double.parse(minusPaybill.text == '' ? '0.0' : minusPaybill.text), double.parse(minusPaySalary.text == '' ? '0.0' : minusPaySalary.text), double.parse(minusPayRent.text == '' ? '0.0' : minusPayRent.text), double.parse(minusBuyGoodPay.text == '' ? '0.0' : minusBuyGoodPay.text), double.parse(minusPreZakat.text == '' ? '0.0' : minusPreZakat.text)),
//         //     double.parse(goldPrice.text),
//         //     double.parse(silverPrice.text));
//       });
//     } else if (_currentStep == 8) {
//       Map<String, dynamic> row = {
//         DatabaseHelper.zakatId: new DateTime.now().millisecondsSinceEpoch,
//         DatabaseHelper.goldAkhoutKyatthar:
//             goldAkhoutKyatthar.text != '' ? goldAkhoutKyatthar.text : 0.0,
//         DatabaseHelper.goldAkhoutPae:
//             goldAkhoutPae.text != '' ? goldAkhoutPae.text : 0.0,
//         DatabaseHelper.goldAkhoutYwae:
//             goldAkhoutYwae.text != '' ? goldAkhoutYwae.text : 0.0,
//         DatabaseHelper.goldAhtaeKyatthar:
//             goldAhtaeKyatthar.text != '' ? goldAhtaeKyatthar.text : 0.0,
//         DatabaseHelper.goldAhtaePae:
//             goldAhtaePae.text != '' ? goldAhtaePae.text : 0.0,
//         DatabaseHelper.goldAhtaeYwae:
//             goldAhtaeYwae.text != '' ? goldAhtaeYwae.text : 0.0,
//         DatabaseHelper.goldPyitceeKyatthar:
//             goldPyitceeKyatthar.text != '' ? goldPyitceeKyatthar.text : 0.0,
//         DatabaseHelper.goldPyitceePae:
//             goldPyitceePae.text != '' ? goldPyitceePae.text : 0.0,
//         DatabaseHelper.goldPyitceeYwae:
//             goldPyitceeYwae.text != '' ? goldPyitceeYwae.text : 0.0,
//         DatabaseHelper.whiteSilverAkhoutKyatthar:
//             whiteSilverAkhoutKyatthar.text != ''
//                 ? whiteSilverAkhoutKyatthar.text
//                 : 0.0,
//         DatabaseHelper.whiteSilverAkhoutPae:
//             whiteSilverAkhoutPae.text != '' ? whiteSilverAkhoutPae.text : 0.0,
//         DatabaseHelper.whiteSilverAkhoutYwae:
//             whiteSilverAkhoutYwae.text != '' ? whiteSilverAkhoutYwae.text : 0.0,
//         DatabaseHelper.whiteSilverAhtaeKyatthar:
//             whiteSilverAhtaeKyatthar.text != ''
//                 ? whiteSilverAhtaeKyatthar.text
//                 : 0.0,
//         DatabaseHelper.whiteSilverAhtaePae:
//             whiteSilverAhtaePae.text != '' ? whiteSilverAhtaePae.text : 0.0,
//         DatabaseHelper.whiteSilverAhtaeYwae:
//             whiteSilverAhtaeYwae.text != '' ? whiteSilverAhtaeYwae.text : 0.0,
//         DatabaseHelper.whiteSilverPyitceeKyatthar:
//             whiteSilverPyitceeKyatthar.text != ''
//                 ? whiteSilverPyitceeKyatthar.text
//                 : 0.0,
//         DatabaseHelper.whiteSilverPyitceePae:
//             whiteSilverPyitceePae.text != '' ? whiteSilverPyitceePae.text : 0.0,
//         DatabaseHelper.whiteSilverPyitceeYwae: whiteSilverPyitceeYwae.text != ''
//             ? whiteSilverPyitceeYwae.text
//             : 0.0,
//         DatabaseHelper.silverAkhoutKyatthar:
//             silverAkhoutKyatthar.text != '' ? silverAkhoutKyatthar.text : 0.0,
//         DatabaseHelper.silverAkhoutPae:
//             silverAkhoutPae.text != '' ? silverAkhoutPae.text : 0.0,
//         DatabaseHelper.silverAkhoutYwae:
//             silverAkhoutYwae.text != '' ? silverAkhoutYwae.text : 0.0,
//         DatabaseHelper.silverAhtaeKyatthar:
//             silverAhtaeKyatthar.text != '' ? silverAhtaeKyatthar.text : 0.0,
//         DatabaseHelper.silverAhtaePae:
//             silverAhtaePae.text != '' ? silverAhtaePae.text : 0.0,
//         DatabaseHelper.silverAhtaeYwae:
//             silverAhtaeYwae.text != '' ? silverAhtaeYwae.text : 0.0,
//         DatabaseHelper.silverPyitceeKyatthar:
//             silverPyitceeKyatthar.text != '' ? silverPyitceeKyatthar.text : 0.0,
//         DatabaseHelper.silverPyitceePae:
//             silverPyitceePae.text != '' ? silverPyitceePae.text : 0.0,
//         DatabaseHelper.silverPyitceeYwae:
//             silverPyitceeYwae.text != '' ? silverPyitceeYwae.text : 0.0,
//         DatabaseHelper.inHandSuHtarTaw:
//             inHandSuHtarTaw.text != '' ? inHandSuHtarTaw.text : 0.0,
//         DatabaseHelper.inHandPyitceeSold:
//             inHandPyitceeSold.text != '' ? inHandPyitceeSold.text : 0.0,
//         DatabaseHelper.inHandPyitceeBorrow:
//             inHandPyitceeBorrow.text != '' ? inHandPyitceeBorrow.text : 0.0,
//         DatabaseHelper.inHandForeignCurrency:
//             inHandForeignCurrency.text != '' ? inHandForeignCurrency.text : 0.0,
//         DatabaseHelper.inHandContract:
//             inHandContract.text != '' ? inHandContract.text : 0.0,
//         DatabaseHelper.inHandOther:
//             inHandOther.text != '' ? inHandOther.text : 0.0,
//         DatabaseHelper.inBankInBank:
//             inBankInBank.text != '' ? inBankInBank.text : 0.0,
//         DatabaseHelper.inBankThuMyarHlwae:
//             inBankThuMyarHlwae.text != '' ? inBankThuMyarHlwae.text : 0.0,
//         DatabaseHelper.inBankSalary:
//             inBankSalary.text != '' ? inBankSalary.text : 0.0,
//         DatabaseHelper.inBankOther:
//             inBankOther.text != '' ? inBankOther.text : 0.0,
//         DatabaseHelper.thuMyarDebtPyitceeSold: thuMyarDebtPyitceeSold.text != ''
//             ? thuMyarDebtPyitceeSold.text
//             : 0.0,
//         DatabaseHelper.thuMyarDebtChayPay:
//             thuMyarDebtChayPay.text != '' ? thuMyarDebtChayPay.text : 0.0,
//         DatabaseHelper.thuMyarDebtAttHtrTaw:
//             thuMyarDebtAttHtrTaw.text != '' ? thuMyarDebtAttHtrTaw.text : 0.0,
//         DatabaseHelper.thuMyarDebtOther:
//             thuMyarDebtOther.text != '' ? thuMyarDebtOther.text : 0.0,
//         DatabaseHelper.realEstateSellHouse:
//             realEstateSellHouse.text != '' ? realEstateSellHouse.text : 0.0,
//         DatabaseHelper.realEstateSellEscort:
//             realEstateSellEscort.text != '' ? realEstateSellEscort.text : 0.0,
//         DatabaseHelper.realEstateSellCar:
//             realEstateSellCar.text != '' ? realEstateSellCar.text : 0.0,
//         DatabaseHelper.realEstateOther:
//             realEstateOther.text != '' ? realEstateOther.text : 0.0,
//         DatabaseHelper.rawWearhouse:
//             rawWearhouse.text != '' ? rawWearhouse.text : 0.0,
//         DatabaseHelper.rawHome: rawHome.text != '' ? rawHome.text : 0.0,
//         DatabaseHelper.rawShop: rawShop.text != '' ? rawShop.text : 0.0,
//         DatabaseHelper.rawOther: rawOther.text != '' ? rawOther.text : 0.0,
//         DatabaseHelper.finishWearhouse:
//             finishWearhouse.text != '' ? finishWearhouse.text : 0.0,
//         DatabaseHelper.finishHome:
//             finishHome.text != '' ? finishHome.text : 0.0,
//         DatabaseHelper.finishShop:
//             finishShop.text != '' ? finishShop.text : 0.0,
//         DatabaseHelper.finishAnimal:
//             finishAnimal.text != '' ? finishAnimal.text : 0.0,
//         DatabaseHelper.finishOther:
//             finishOther.text != '' ? finishOther.text : 0.0,
//         DatabaseHelper.sate: sate.text != '' ? sate.text : 0.0,
//         DatabaseHelper.thoe: thoe.text != '' ? thoe.text : 0.0,
//         DatabaseHelper.kalaout: kalaout.text != '' ? kalaout.text : 0.0,
//         DatabaseHelper.kywae: kywae.text != '' ? kywae.text : 0.0,
//         DatabaseHelper.nwar: nwar.text != '' ? nwar.text : 0.0,
//         DatabaseHelper.minusDebtMahur:
//             minusDebtMahur.text != '' ? minusDebtMahur.text : 0.0,
//         DatabaseHelper.minusDebt: minusDebt.text != '' ? minusDebt.text : 0.0,
//         DatabaseHelper.minusSukyae:
//             minusSukyae.text != '' ? minusSukyae.text : 0.0,
//         DatabaseHelper.minusMeterBill:
//             minusMeterBill.text != '' ? minusMeterBill.text : 0.0,
//         DatabaseHelper.minusPaybill:
//             minusPaybill.text != '' ? minusPaybill.text : 0.0,
//         DatabaseHelper.minusPaySalary:
//             minusPaySalary.text != '' ? minusPaySalary.text : 0.0,
//         DatabaseHelper.minusPayRent:
//             minusPayRent.text != '' ? minusPayRent.text : 0.0,
//         DatabaseHelper.minusBuyGoodPay:
//             minusBuyGoodPay.text != '' ? minusBuyGoodPay.text : 0.0,
//         DatabaseHelper.minusPreZakat:
//             minusPreZakat.text != '' ? minusPreZakat.text : 0.0,
//         DatabaseHelper.createdAt: DateTime.now().toString(),
//         DatabaseHelper.updatedAt: DateTime.now().toString(),
//         DatabaseHelper.goldRate: goldPrice.text,
//         DatabaseHelper.silverRate: silverPrice.text,
//         DatabaseHelper.yourWorth: _result['netWorth']!,
//         DatabaseHelper.yourZakat: _result['result']!
//       };
//       dbHelper
//           .insertZakat(row)
//           .then((value) => print(value))
//           .catchError((onError) => print(onError.toString()));

//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (context) => ZakatListScreen()),
//           (Route<dynamic> route) => false);
//     }

//     _currentStep < 8 ? setState(() => _currentStep += 1) : null;
//   }

//   cancel() {
//     _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
//   }
// }
