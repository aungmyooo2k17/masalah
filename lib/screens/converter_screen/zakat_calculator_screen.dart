import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/reusable_widget/app_text.dart';

class ZakatCalculator extends StatefulWidget {
  @override
  _ZakatCalculatorState createState() => _ZakatCalculatorState();
}

class _ZakatCalculatorState extends State<ZakatCalculator> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('ရွှေ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('ရွှေဖြူ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('ငွေ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('ပိုက်ဆံ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "လက်ထဲရှိ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'စုဆောင်းထားသော'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ပစ္စည်းရောင်း၍ရထားသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ပစ္စည်းငှားရမ်းခရထားသော')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'နိုင်ငံခြားငွေ(ကျပ်ဖြင့်)')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ငွေချေးစာချုပ်၊ချက်လက်မှတ်...')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ဘဏ်ထဲရှိ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ဘဏ်ထဲထည့်ထားသော'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'သူများလွှဲပေးထားသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'လစာ၊ပင်စင်တစ်ခုခုရထားသော')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'အခြား (Digital Money, etc)')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "သူများကိုပေးထားသောအကြွေး",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ပစ္စည်းရောင်း၍ရရန်ရှိသော'),
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ချေးပေးထားသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'တစ်ဦးတစ်ယောက်ထံအပ်နှံထားသော')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('အရောင်းအဝယ်ကုန်ပစ္စည်း'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အိမ်၊ခြံ၊မြေ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ရောင်းရန်ရှိသောအိမ်'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ရောင်းရန်ရှိသောခြံ/မြေ'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ရောင်းရန်ရှိသောကား')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ကုန်ကြမ်းများ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ဂိုထောင်တွင်ရှိသော'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'အိမ်တွင်ရှိသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ဆိုင်တွင်ရှိသော')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ကုန်ချောများ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ဂိုထောင်တွင်ရှိသော'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'အိမ်တွင်ရှိသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ဆိုင်တွင်ရှိသော')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'မွေးမြူရေးခြံထဲရှိရောင်းရန်သားကောင်များ')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text(
                        'စားကျက်တွင်လွတ်ထားသောမွေးမြူရေးတိရိစ္ဆာန်များ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ကုလားအုပ်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ကျွဲ၊နွား",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ဆိတ်၊သိုး",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('အနှုတ်စာရင်း'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ဇနီးကိုမပေးရသေးသောမဟ်ရ်'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'သူများကိုပေးဆပ်ရမည့်အကြွေး'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'စုကြေးရရှိပြီးပေးသွင်းရန်ကျန်ငွေပေါင်း')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ပေးဆောင်ရန်ကျန်သောမီတာခ')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ပေးဆောင်ရန်ကျန်သောအဖိုးအခများ')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ဝန်ထမ်းများကိုပေးရန်ကျန်သောလစာများ')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ပေးဆောင်ရန်ကျန်သောငှားရမ်းခများ')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ပစ္စည်းဝယ်ပြီးပေးချေရန်ကျန်သောအကြွေး')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ယခင်နှစ်များ၏မပေးရသေးသောဇကားသ်')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('ပေါက်ဈေး'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ရွှေဈေးစုံစမ်း၍ထည့်ရန်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: ' '),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ငွေဈေးစုံစမ်း၍ထည့်ရန်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: ' '),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အောက်တိုတွက်ပေးပါ။",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: ' '),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('အဖြေ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 8 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
