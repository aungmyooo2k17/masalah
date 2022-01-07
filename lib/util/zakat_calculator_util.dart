import 'dart:io';

import 'package:masalah/util/share_preference_util.dart';

class ZakatCalculatorUtil {
  saveGoldAkhout(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("GoldAkhout_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil().addDoubleToSF("GoldAkhout_pae", double.parse(pae));
    SharedPreferenceUtil().addDoubleToSF("GoldAkhout_ywae", double.parse(ywae));
  }

  getGoldAkhout() {
    return {
      "kyatthar":
          SharedPreferenceUtil().getDoubleValuesSF("GoldAkhout_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("GoldAkhout_pae"),
      "ywae": SharedPreferenceUtil().getDoubleValuesSF("GoldAkhout_ywae")
    };
  }

  saveGoldAHtae(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("GoldAHtae_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil().addDoubleToSF("GoldAHtae_pae", double.parse(pae));
    SharedPreferenceUtil().addDoubleToSF("GoldAHtae_ywae", double.parse(ywae));
  }

  getGoldAHtae() {
    return {
      "kyatthar":
          SharedPreferenceUtil().getDoubleValuesSF("GoldAHtae_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("GoldAHtae_pae"),
      "ywae": SharedPreferenceUtil().getDoubleValuesSF("GoldAHtae_ywae")
    };
  }

  saveGoldPyitCee(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("GoldPyitCee_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil().addDoubleToSF("GoldPyitCee_pae", double.parse(pae));
    SharedPreferenceUtil()
        .addDoubleToSF("GoldPyitCee_ywae", double.parse(ywae));
  }

  getGoldPyitCee() {
    return {
      "kyatthar":
          SharedPreferenceUtil().getDoubleValuesSF("GoldPyitCee_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("GoldPyitCee_pae"),
      "ywae": SharedPreferenceUtil().getDoubleValuesSF("GoldPyitCee_ywae")
    };
  }

  saveSilverAkhout(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("SilverAkhout_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil().addDoubleToSF("SilverAkhout_pae", double.parse(pae));
    SharedPreferenceUtil()
        .addDoubleToSF("SilverAkhout_ywae", double.parse(ywae));
  }

  getSilverAkhout() {
    return {
      "kyatthar":
          SharedPreferenceUtil().getDoubleValuesSF("SilverAkhout_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("SilverAkhout_pae"),
      "ywae": SharedPreferenceUtil().getDoubleValuesSF("SilverAkhout_ywae")
    };
  }

  saveSilverAHtae(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("SilverAHtae_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil().addDoubleToSF("SilverAHtae_pae", double.parse(pae));
    SharedPreferenceUtil()
        .addDoubleToSF("SilverAHtae_ywae", double.parse(ywae));
  }

  getSilverAHtae() {
    return {
      "kyatthar":
          SharedPreferenceUtil().getDoubleValuesSF("SilverAHtae_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("SilverAHtae_pae"),
      "ywae": SharedPreferenceUtil().getDoubleValuesSF("SilverAHtae_ywae")
    };
  }

  saveSilverPyitCee(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("SilverPyitCee_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil()
        .addDoubleToSF("SilverPyitCee_pae", double.parse(pae));
    SharedPreferenceUtil()
        .addDoubleToSF("SilverPyitCee_ywae", double.parse(ywae));
  }

  getSilverPyitCee() {
    return {
      "kyatthar":
          SharedPreferenceUtil().getDoubleValuesSF("SilverPyitCee_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("SilverPyitCee_pae"),
      "ywae": SharedPreferenceUtil().getDoubleValuesSF("SilverPyitCee_ywae")
    };
  }

  saveWhiteSilverAkhout(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverAkhout_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverAkhout_pae", double.parse(pae));
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverAkhout_ywae", double.parse(ywae));
  }

  getWhiteSilverAkhout() {
    return {
      "kyatthar": SharedPreferenceUtil()
          .getDoubleValuesSF("WhiteSilverAkhout_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("WhiteSilverAkhout_pae"),
      "ywae": SharedPreferenceUtil().getDoubleValuesSF("WhiteSilverAkhout_ywae")
    };
  }

  saveWhiteSilverAHtae(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverAHtae_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverAHtae_pae", double.parse(pae));
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverAHtae_ywae", double.parse(ywae));
  }

  getWhiteSilverAHtae() {
    return {
      "kyatthar":
          SharedPreferenceUtil().getDoubleValuesSF("WhiteSilverAHtae_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("WhiteSilverAHtae_pae"),
      "ywae": SharedPreferenceUtil().getDoubleValuesSF("WhiteSilverAHtae_ywae")
    };
  }

  saveWhiteSilverPyitCee(kyatthar, pae, ywae) {
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverPyitCee_kyatthar", double.parse(kyatthar));
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverPyitCee_pae", double.parse(pae));
    SharedPreferenceUtil()
        .addDoubleToSF("WhiteSilverPyitCee_ywae", double.parse(ywae));
  }

  getWhiteSilverPyitCee() {
    return {
      "kyatthar": SharedPreferenceUtil()
          .getDoubleValuesSF("WhiteSilverPyitCee_kyatthar"),
      "pae": SharedPreferenceUtil().getDoubleValuesSF("WhiteSilverPyitCee_pae"),
      "ywae":
          SharedPreferenceUtil().getDoubleValuesSF("WhiteSilverPyitCee_ywae")
    };
  }

  saveInHand(inHandSuHtarTaw, inHandPyitceeSold, inHandPyitceeBorrow,
      inHandForeignCurrency, inHandContract, inHandOther) {
    SharedPreferenceUtil()
        .addDoubleToSF("inHandSuHtarTaw", double.parse(inHandSuHtarTaw));
    SharedPreferenceUtil()
        .addDoubleToSF("inHandPyitceeSold", double.parse(inHandPyitceeSold));
    SharedPreferenceUtil().addDoubleToSF(
        "inHandPyitceeBorrow", double.parse(inHandPyitceeBorrow));
    SharedPreferenceUtil().addDoubleToSF(
        "inHandForeignCurrency", double.parse(inHandForeignCurrency));
    SharedPreferenceUtil()
        .addDoubleToSF("inHandContract", double.parse(inHandContract));
    SharedPreferenceUtil()
        .addDoubleToSF("inHandOther", double.parse(inHandOther));
  }

  getInHand() {
    return {
      "inHandSuHtarTaw":
          SharedPreferenceUtil().getDoubleValuesSF("inHandSuHtarTaw"),
      "inHandPyitceeSold":
          SharedPreferenceUtil().getDoubleValuesSF("inHandPyitceeSold"),
      "inHandPyitceeBorrow":
          SharedPreferenceUtil().getDoubleValuesSF("inHandPyitceeBorrow"),
      "inHandForeignCurrency":
          SharedPreferenceUtil().getDoubleValuesSF("inHandForeignCurrency"),
      "inHandContract":
          SharedPreferenceUtil().getDoubleValuesSF("inHandContract"),
      "inHandOther": SharedPreferenceUtil().getDoubleValuesSF("inHandOther"),
    };
  }

  saveInBank(inBankInBank, inBankThuMyarHlwae, inBankSalary, inBankOther) {
    SharedPreferenceUtil()
        .addDoubleToSF("inBankInBank", double.parse(inBankInBank));
    SharedPreferenceUtil()
        .addDoubleToSF("inBankThuMyarHlwae", double.parse(inBankThuMyarHlwae));
    SharedPreferenceUtil()
        .addDoubleToSF("inBankSalary", double.parse(inBankSalary));
    SharedPreferenceUtil()
        .addDoubleToSF("inBankOther", double.parse(inBankOther));
  }

  getInBank() {
    return {
      "inBankInBank": SharedPreferenceUtil().getDoubleValuesSF("inBankInBank"),
      "inBankThuMyarHlwae":
          SharedPreferenceUtil().getDoubleValuesSF("inBankThuMyarHlwae"),
      "inBankSalary": SharedPreferenceUtil().getDoubleValuesSF("inBankSalary"),
      "inBankOther": SharedPreferenceUtil().getDoubleValuesSF("inBankOther"),
    };
  }

  saveThuMyarPayHtrTawDebt(thuMyarDebtPyitceeSold, thuMyarDebtChayPay,
      thuMyarDebtAttHtrTaw, thuMyarDebtOther) {
    SharedPreferenceUtil().addDoubleToSF(
        "thuMyarDebtPyitceeSold", double.parse(thuMyarDebtPyitceeSold));
    SharedPreferenceUtil()
        .addDoubleToSF("thuMyarDebtChayPay", double.parse(thuMyarDebtChayPay));
    SharedPreferenceUtil().addDoubleToSF(
        "thuMyarDebtAttHtrTaw", double.parse(thuMyarDebtAttHtrTaw));
    SharedPreferenceUtil()
        .addDoubleToSF("thuMyarDebtOther", double.parse(thuMyarDebtOther));
  }

  getThuMyarPayHtrTawDebt() {
    return {
      "thuMyarDebtPyitceeSold":
          SharedPreferenceUtil().getDoubleValuesSF("thuMyarDebtPyitceeSold"),
      "thuMyarDebtChayPay":
          SharedPreferenceUtil().getDoubleValuesSF("thuMyarDebtChayPay"),
      "thuMyarDebtAttHtrTaw":
          SharedPreferenceUtil().getDoubleValuesSF("thuMyarDebtAttHtrTaw"),
      "thuMyarDebtOther":
          SharedPreferenceUtil().getDoubleValuesSF("thuMyarDebtOther"),
    };
  }

  saveRealEstate(realEstateSellHouse, realEstateSellEscort, realEstateSellCar,
      realEstateOther) {
    SharedPreferenceUtil().addDoubleToSF(
        "realEstateSellHouse", double.parse(realEstateSellHouse));
    SharedPreferenceUtil().addDoubleToSF(
        "realEstateSellEscort", double.parse(realEstateSellEscort));
    SharedPreferenceUtil()
        .addDoubleToSF("realEstateSellCar", double.parse(realEstateSellCar));
    SharedPreferenceUtil()
        .addDoubleToSF("realEstateOther", double.parse(realEstateOther));
  }

  getRealEstate() {
    return {
      "realEstateSellHouse":
          SharedPreferenceUtil().getDoubleValuesSF("realEstateSellHouse"),
      "realEstateSellEscort":
          SharedPreferenceUtil().getDoubleValuesSF("realEstateSellEscort"),
      "realEstateSellCar":
          SharedPreferenceUtil().getDoubleValuesSF("realEstateSellCar"),
      "realEstateOther":
          SharedPreferenceUtil().getDoubleValuesSF("realEstateOther"),
    };
  }

  saveRaw(rawWearhouse, rawHome, rawShop, rawOther) {
    SharedPreferenceUtil()
        .addDoubleToSF("rawWearhouse", double.parse(rawWearhouse));
    SharedPreferenceUtil().addDoubleToSF("rawHome", double.parse(rawHome));
    SharedPreferenceUtil().addDoubleToSF("rawShop", double.parse(rawShop));
    SharedPreferenceUtil().addDoubleToSF("rawOther", double.parse(rawOther));
  }

  getRaw() {
    return {
      "rawWearhouse": SharedPreferenceUtil().getDoubleValuesSF("rawWearhouse"),
      "rawHome": SharedPreferenceUtil().getDoubleValuesSF("rawHome"),
      "rawShop": SharedPreferenceUtil().getDoubleValuesSF("rawShop"),
      "rawOther": SharedPreferenceUtil().getDoubleValuesSF("rawOther"),
    };
  }

  saveFinish(
      finishWearhouse, finishHome, finishShop, finishAnimal, finishOther) {
    SharedPreferenceUtil()
        .addDoubleToSF("finishWearhouse", double.parse(finishWearhouse));
    SharedPreferenceUtil()
        .addDoubleToSF("finishHome", double.parse(finishHome));
    SharedPreferenceUtil()
        .addDoubleToSF("finishShop", double.parse(finishShop));
    SharedPreferenceUtil()
        .addDoubleToSF("finishAnimal", double.parse(finishAnimal));
    SharedPreferenceUtil()
        .addDoubleToSF("finishOther", double.parse(finishOther));
  }

  getFinish() {
    return {
      "finishWearhouse":
          SharedPreferenceUtil().getDoubleValuesSF("finishWearhouse"),
      "finishHome": SharedPreferenceUtil().getDoubleValuesSF("finishHome"),
      "finishShop": SharedPreferenceUtil().getDoubleValuesSF("finishShop"),
      "finishAnimal": SharedPreferenceUtil().getDoubleValuesSF("finishAnimal"),
      "finishOther": SharedPreferenceUtil().getDoubleValuesSF("finishOther"),
    };
  }

  saveMinus(
      minusDebtMahur,
      minusDebt,
      minusSukyae,
      minusMeterBill,
      minusPaybill,
      minusPaySalary,
      minusPayRent,
      minusBuyGoodPay,
      minusPreZakat) {
    SharedPreferenceUtil()
        .addDoubleToSF("minusDebtMahur", double.parse(minusDebtMahur));
    SharedPreferenceUtil().addDoubleToSF("minusDebt", double.parse(minusDebt));
    SharedPreferenceUtil()
        .addDoubleToSF("minusSukyae", double.parse(minusSukyae));
    SharedPreferenceUtil()
        .addDoubleToSF("minusMeterBill", double.parse(minusMeterBill));
    SharedPreferenceUtil()
        .addDoubleToSF("minusPaybill", double.parse(minusPaybill));
    SharedPreferenceUtil()
        .addDoubleToSF("minusPaySalary", double.parse(minusPaySalary));
    SharedPreferenceUtil()
        .addDoubleToSF("minusPayRent", double.parse(minusPayRent));
    SharedPreferenceUtil()
        .addDoubleToSF("minusBuyGoodPay", double.parse(minusBuyGoodPay));
    SharedPreferenceUtil()
        .addDoubleToSF("minusPreZakat", double.parse(minusPreZakat));
  }

  saveGoldPrice(price) {
    SharedPreferenceUtil().addDoubleToSF("goldPrice", double.parse(price));
  }

  getGoldPrice() {
    return SharedPreferenceUtil().getDoubleValuesSF("goldPrice");
  }

  saveSilverPrice(price) {
    SharedPreferenceUtil().addDoubleToSF("silverPrice", double.parse(price));
  }

  getSilverPrice() {
    return SharedPreferenceUtil().getDoubleValuesSF("silverPrice");
  }

  getMinus() {
    return {
      "minusDebtMahur":
          SharedPreferenceUtil().getDoubleValuesSF("minusDebtMahur"),
      "minusDebt": SharedPreferenceUtil().getDoubleValuesSF("minusDebt"),
      "minusSukyae": SharedPreferenceUtil().getDoubleValuesSF("minusSukyae"),
      "minusMeterBill":
          SharedPreferenceUtil().getDoubleValuesSF("minusMeterBill"),
      "minusPaybill": SharedPreferenceUtil().getDoubleValuesSF("minusPaybill"),
      "minusPaySalary":
          SharedPreferenceUtil().getDoubleValuesSF("minusPaySalary"),
      "minusPayRent": SharedPreferenceUtil().getDoubleValuesSF("minusPayRent"),
      "minusBuyGoodPay":
          SharedPreferenceUtil().getDoubleValuesSF("minusBuyGoodPay"),
      "minusPreZakat":
          SharedPreferenceUtil().getDoubleValuesSF("minusPreZakat"),
    };
  }

  // gold 1kyatthar, 2pae, 5 ywae => total ywae => 149 ywae
  // silver 1kyatthar, 2pae, 5 ywae => total ywae => 149 ywae
  // platinum 1kyatthar, 2pae, 5 ywae => total ywae => 149 ywae
  calcTotalYwae(kyatthar, pae, ywae) {
    double totalYwae = 0.0;
    totalYwae = totalYwae + (kyatthar * 128);
    totalYwae = totalYwae + (pae * 8);

    return totalYwae;
  }

  //gold price - 2000000 => oneYwaePrice => 15625
  //platinum price - 2000000 => oneYwaePrice => 15625
  //silver price - 2000000 => oneYwaePrice => 156.25
  calcOneYwaePrice(oneKyattharPrice) {
    return oneKyattharPrice / 128;
  }

  // The price that have in man
  // gold 15625 * 149 = 2328125
  // platinum 15625 * 149 = 2328125
  // silver 156.25 * 149 = 23281.25
  calcTotalGoldAndSilverPrice(oneYwaePrice, totalYwae) {
    return oneYwaePrice * totalYwae;
  }

  goldZakatAmount(goldPrice) {
    return calcOneYwaePrice(goldPrice) * 673.5;
  }

  silverZakatAmount(silver) {
    return calcOneYwaePrice(silver) * 4715.5;
  }

  calcFinalZakatAmount(
      totalGoldPlatinum, totalSilverOther, totalMinus, goldPrice, silverPrice) {
    if (totalSilverOther == 0) {
      if (totalGoldPlatinum >= goldZakatAmount(goldPrice)) {
        return totalGoldPlatinum / 40;
      } else {
        return "ဇကားသ်ဝါဂျိဗ်မထိုက်သေးပါ";
      }
    } else {
      double totalAmount = (totalGoldPlatinum + totalSilverOther) - totalMinus;
      if (totalAmount >= silverZakatAmount(silverPrice)) {
        return totalAmount / 40;
      } else {
        return "ဇကားသ်ဝါဂျိဗ်မထိုက်သေးပါ";
      }
    }
  }

  getTotalGoldPlatinum(shweOneKyattharPrice) {
    var totalYwae = 0.0;
    ZakatCalculatorUtil().getGoldAkhout()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getGoldAkhout()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getGoldAkhout()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });

    ZakatCalculatorUtil().getGoldAHtae()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getGoldAHtae()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getGoldAHtae()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });

    ZakatCalculatorUtil().getGoldPyitCee()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getGoldPyitCee()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getGoldPyitCee()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });

    ZakatCalculatorUtil().getWhiteSilverAkhout()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getWhiteSilverAkhout()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getWhiteSilverAkhout()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });

    ZakatCalculatorUtil().getWhiteSilverAHtae()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getWhiteSilverAHtae()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getWhiteSilverAHtae()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });

    ZakatCalculatorUtil().getWhiteSilverPyitCee()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getWhiteSilverPyitCee()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getWhiteSilverPyitCee()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });

    return totalYwae * calcOneYwaePrice(shweOneKyattharPrice);
  }

  getTotalGoldPlatinum2(
      shweOneKyattharPrice,
      goldAkhoutKyatthar,
      goldAkhoutPae,
      goldAkhoutYwae,
      goldAhtaeKyatthar,
      goldAhtaePae,
      goldAhtaeYwae,
      goldPyitceeKyatthar,
      goldPyitceePae,
      goldPyitceeYwae,
      whiteSilverAkhoutKyatthar,
      whiteSilverAkhoutPae,
      whiteSilverAkhoutYwae,
      whiteSilverAhtaeKyatthar,
      whiteSilverAhtaePae,
      whiteSilverAhtaeYwae,
      whiteSilverPyitceeKyatthar,
      whiteSilverPyitceePae,
      whiteSilverPyitceeYwae) {
    var totalYwae = 0.0;

    totalYwae = totalYwae + (goldAkhoutKyatthar * 128);
    totalYwae = totalYwae + (goldAkhoutPae * 8);
    totalYwae = totalYwae + goldAkhoutYwae;
    totalYwae = totalYwae + (goldAhtaeKyatthar * 128);
    totalYwae = totalYwae + (goldAhtaePae * 8);
    totalYwae = totalYwae + goldAhtaeYwae;
    totalYwae = totalYwae + (goldPyitceeKyatthar * 128);
    totalYwae = totalYwae + (goldPyitceePae * 8);
    totalYwae = totalYwae + goldPyitceeYwae;

    totalYwae = totalYwae + (whiteSilverAkhoutKyatthar * 128);
    totalYwae = totalYwae + (whiteSilverAkhoutPae * 8);
    totalYwae = totalYwae + whiteSilverAkhoutYwae;
    totalYwae = totalYwae + (whiteSilverAhtaeKyatthar * 128);
    totalYwae = totalYwae + (whiteSilverAhtaePae * 8);
    totalYwae = totalYwae + whiteSilverAhtaeYwae;
    totalYwae = totalYwae + (whiteSilverPyitceeKyatthar * 128);
    totalYwae = totalYwae + (whiteSilverPyitceePae * 8);
    totalYwae = totalYwae + whiteSilverPyitceeYwae;

    return totalYwae * calcOneYwaePrice(shweOneKyattharPrice);
  }

  getTotalSilverMoneyOther(silverOneKyattharPrice) {
    var totalYwae = 0.0;
    var totalSilver = 0.0;
    var totalCash = 0.0;
    ZakatCalculatorUtil().getSilverAkhout()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getSilverAkhout()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getSilverAkhout()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });

    ZakatCalculatorUtil().getSilverAHtae()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getSilverAHtae()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getSilverAHtae()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });

    ZakatCalculatorUtil().getSilverPyitCee()["kyatthar"].then((value) {
      totalYwae = totalYwae + (value * 128);
    });
    ZakatCalculatorUtil().getSilverPyitCee()["pae"].then((value) {
      totalYwae = totalYwae + (value * 8);
    });
    ZakatCalculatorUtil().getSilverPyitCee()["ywae"].then((value) {
      totalYwae = totalYwae + value;
    });
    totalSilver = totalYwae * calcOneYwaePrice(silverOneKyattharPrice);

    ZakatCalculatorUtil().getInHand()["inHandSuHtarTaw"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getInHand()["inHandPyitceeSold"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getInHand()["inHandPyitceeBorrow"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getInHand()["inHandForeignCurrency"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getInHand()["inHandContract"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getInHand()["inHandOther"].then((v) {
      totalCash = totalCash + v;
    });
    // .......Inhand.......

    ZakatCalculatorUtil().getInBank()["inBankInBank"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getInBank()["inBankThuMyarHlwae"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getInBank()["inBankSalary"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getInBank()["inBankOther"].then((v) {
      totalCash = totalCash + v;
    });
    // ..........InBank..........

    ZakatCalculatorUtil()
        .getThuMyarPayHtrTawDebt()["thuMyarDebtPyitceeSold"]
        .then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil()
        .getThuMyarPayHtrTawDebt()["thuMyarDebtChayPay"]
        .then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil()
        .getThuMyarPayHtrTawDebt()["thuMyarDebtAttHtrTaw"]
        .then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil()
        .getThuMyarPayHtrTawDebt()["thuMyarDebtOther"]
        .then((v) {
      totalCash = totalCash + v;
    });
    // .........ThuMyarPayHtrTawDebt..........

    ZakatCalculatorUtil().getRealEstate()["realEstateSellHouse"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getRealEstate()["realEstateSellEscort"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getRealEstate()["realEstateSellCar"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getRealEstate()["realEstateOther"].then((v) {
      totalCash = totalCash + v;
    });
    // ...........RealEstate............

    ZakatCalculatorUtil().getRaw()["rawWearhouse"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getRaw()["rawHome"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getRaw()["rawShop"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getRaw()["rawOther"].then((v) {
      totalCash = totalCash + v;
    });
    // ..............Raw...........

    ZakatCalculatorUtil().getFinish()["finishWearhouse"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getFinish()["finishHome"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getFinish()["finishShop"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getFinish()["finishAnimal"].then((v) {
      totalCash = totalCash + v;
    });
    ZakatCalculatorUtil().getFinish()["finishOther"].then((v) {
      totalCash = totalCash + v;
    });

    return totalSilver + totalCash;
  }

  getTotalSilverMoneyOther2(
      silverPrice,
      silverAkhoutKyatthar,
      silverAkhoutPae,
      silverAkhoutYwae,
      silverAhtaeKyatthar,
      silverAhtaePae,
      silverAhtaeYwae,
      silverPyitceeKyatthar,
      silverPyitceePae,
      silverPyitceeYwae,
      inHandSuHtarTaw,
      inHandPyitceeSold,
      inHandPyitceeBorrow,
      inHandForeignCurrency,
      inHandContract,
      inHandOther,
      inBankInBank,
      inBankThuMyarHlwae,
      inBankSalary,
      inBankOther,
      thuMyarDebtPyitceeSold,
      thuMyarDebtChayPay,
      thuMyarDebtAttHtrTaw,
      thuMyarDebtOther,
      realEstateSellHouse,
      realEstateSellEscort,
      realEstateSellCar,
      realEstateOther,
      rawWearhouse,
      rawHome,
      rawShop,
      rawOther,
      finishWearhouse,
      finishHome,
      finishShop,
      finishAnimal,
      finishOther) {
    var totalYwae = 0.0;
    var totalSilver = 0.0;
    var totalCash = 0.0;

    totalYwae = totalYwae + (silverAkhoutKyatthar * 128);
    totalYwae = totalYwae + (silverAkhoutPae * 8);
    totalYwae = totalYwae + silverAkhoutYwae;
    totalYwae = totalYwae + (silverAhtaeKyatthar * 128);
    totalYwae = totalYwae + (silverAhtaePae * 8);
    totalYwae = totalYwae + silverAhtaeYwae;
    totalYwae = totalYwae + (silverPyitceeKyatthar * 128);
    totalYwae = totalYwae + (silverPyitceePae * 8);
    totalYwae = totalYwae + silverPyitceeYwae;

    totalSilver = totalYwae * calcOneYwaePrice(silverPrice);

    totalCash = totalCash + inHandSuHtarTaw;
    totalCash = totalCash + inHandPyitceeSold;
    totalCash = totalCash + inHandPyitceeBorrow;
    totalCash = totalCash + inHandForeignCurrency;
    totalCash = totalCash + inHandContract;
    totalCash = totalCash + inHandOther;
    totalCash = totalCash + inBankInBank;
    totalCash = totalCash + inBankThuMyarHlwae;
    totalCash = totalCash + inBankSalary;
    totalCash = totalCash + inBankOther;
    totalCash = totalCash + thuMyarDebtPyitceeSold;
    totalCash = totalCash + thuMyarDebtChayPay;
    totalCash = totalCash + thuMyarDebtAttHtrTaw;
    totalCash = totalCash + thuMyarDebtOther;
    totalCash = totalCash + realEstateSellHouse;
    totalCash = totalCash + realEstateSellEscort;
    totalCash = totalCash + realEstateSellCar;
    totalCash = totalCash + realEstateOther;
    totalCash = totalCash + rawWearhouse;
    totalCash = totalCash + rawHome;
    totalCash = totalCash + rawShop;
    totalCash = totalCash + rawOther;
    totalCash = totalCash + finishWearhouse;
    totalCash = totalCash + finishHome;
    totalCash = totalCash + finishShop;
    totalCash = totalCash + finishAnimal;
    totalCash = totalCash + finishOther;

    return totalSilver + totalCash;
  }

  getTotalMinus() {
    var totalMinus = 0.0;
    ZakatCalculatorUtil().getMinus()["minusDebtMahur"].then((v) {
      totalMinus = totalMinus + v;
    });
    ZakatCalculatorUtil().getMinus()["minusDebt"].then((v) {
      totalMinus = totalMinus + v;
    });
    ZakatCalculatorUtil().getMinus()["minusSukyae"].then((v) {
      totalMinus = totalMinus + v;
    });
    ZakatCalculatorUtil().getMinus()["minusMeterBill"].then((v) {
      totalMinus = totalMinus + v;
    });
    ZakatCalculatorUtil().getMinus()["minusPaybill"].then((v) {
      totalMinus = totalMinus + v;
    });
    ZakatCalculatorUtil().getMinus()["minusPaySalary"].then((v) {
      totalMinus = totalMinus + v;
    });
    ZakatCalculatorUtil().getMinus()["minusPayRent"].then((v) {
      totalMinus = totalMinus + v;
    });
    ZakatCalculatorUtil().getMinus()["minusBuyGoodPay"].then((v) {
      totalMinus = totalMinus + v;
    });
    ZakatCalculatorUtil().getMinus()["minusPreZakat"].then((v) {
      totalMinus = totalMinus + v;
    });

    return totalMinus;
  }

  getTotalMinus2(
      minusDebtMahur,
      minusDebt,
      minusSukyae,
      minusMeterBill,
      minusPaybill,
      minusPaySalary,
      minusPayRent,
      minusBuyGoodPay,
      minusPreZakat) {
    var totalMinus = 0.0;
    totalMinus = totalMinus + minusDebtMahur;
    totalMinus = totalMinus + minusDebt;
    totalMinus = totalMinus + minusSukyae;
    totalMinus = totalMinus + minusMeterBill;
    totalMinus = totalMinus + minusPaybill;
    totalMinus = totalMinus + minusPaySalary;
    totalMinus = totalMinus + minusPayRent;
    totalMinus = totalMinus + minusBuyGoodPay;
    totalMinus = totalMinus + minusPreZakat;

    return totalMinus;
  }

  prepareToCalculateZakat() {}

  calcZakatForGoatSheep(totalGoatSheep) {
    if (totalGoatSheep >= 400) {
      String gs = (totalGoatSheep / 100).toString();
      var arr = gs.split('.');
      return int.parse(arr[0]);
    } else if (totalGoatSheep >= 201) {
      return 3;
    } else if (totalGoatSheep >= 121) {
      return 2;
    } else if (totalGoatSheep >= 40) {
      return 1;
    } else {
      return '';
    }
  }

  calcZakatForKalaout(totalKalaout) {
    print("___________${totalKalaout}___________");
    if (totalKalaout > 150) {
      int x = int.parse((totalKalaout / 150).toStringAsFixed(0));
      int y = x * 150;
      int z = totalKalaout - y;

      String firstRes = 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	${x * 3} ကောင်';

      int xx = int.parse((z / 46).toStringAsFixed(0));
      int yy = xx * 46;
      int zz = z - yy;

      String secRes = 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	$xx ကောင်';
      String sec2Res = '';

      if (zz <= 46 && zz > 36) {
        sec2Res = 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	1 ကောင်';
      } else if (zz >= 36) {
        sec2Res = 'နှစ်နှစ်ပြည့်	ကုလားအုပ်မ	1 ကောင်';
      } else if (zz >= 25) {
        sec2Res = 'တစ်နှစ်ပြည့်	ကုလားအုပ်မ	1 ကောင်';
      } else if (zz >= 20) {
        sec2Res = 'တစ်နှစ်ပြည့်	ဆိတ်	4 ကောင်';
      } else if (zz >= 15) {
        sec2Res = 'တစ်နှစ်ပြည့်	ဆိတ်	3 ကောင်';
      } else if (zz >= 10) {
        sec2Res = 'တစ်နှစ်ပြည့်	ဆိတ်	2 ကောင်';
      } else if (zz >= 5) {
        sec2Res = 'တစ်နှစ်ပြည့်	ဆိတ်	1 ကောင်';
      }

      return firstRes + '\n' + secRes + '\n' + sec2Res;
    } else if (totalKalaout <= 150 && totalKalaout > 145) {
      return 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	3 ကောင်';
    } else if (totalKalaout >= 145) {
      return 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	2 ကောင်	တစ်နှစ်ပြည့်	ကုလားအုပ်မ	1 ကောင်';
    } else if (totalKalaout >= 140) {
      return 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	2 ကောင်	တစ်နှစ်ပြည့်	ဆိတ်	4 ကောင်';
    } else if (totalKalaout >= 135) {
      return 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	2 ကောင်	တစ်နှစ်ပြည့်	ဆိတ်	3 ကောင်';
    } else if (totalKalaout >= 130) {
      return 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	2 ကောင်	တစ်နှစ်ပြည့်	ဆိတ်	2 ကောင်';
    } else if (totalKalaout >= 125) {
      return 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	2 ကောင်	တစ်နှစ်ပြည့်	ဆိတ်	1 ကောင်';
    } else if (totalKalaout >= 91) {
      return 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	2 ကောင်';
    } else if (totalKalaout >= 76) {
      return 'နှစ်နှစ်ပြည့်	ကုလားအုပ်မ	2 ကောင်';
    } else if (totalKalaout >= 61) {
      return 'လေးနှစ်ပြည့်	ကုလားအုပ်မ	1 ကောင်';
    } else if (totalKalaout >= 46) {
      return 'သုံးနှစ်ပြည့်	ကုလားအုပ်မ	1 ကောင်';
    } else if (totalKalaout >= 36) {
      return 'နှစ်နှစ်ပြည့်	ကုလားအုပ်မ	1 ကောင်';
    } else if (totalKalaout >= 25) {
      return 'တစ်နှစ်ပြည့်	ကုလားအုပ်မ	1 ကောင်';
    } else if (totalKalaout >= 20) {
      return 'တစ်နှစ်ပြည့်	ဆိတ်	4 ကောင်';
    } else if (totalKalaout >= 15) {
      return 'တစ်နှစ်ပြည့်	ဆိတ်	3 ကောင်';
    } else if (totalKalaout >= 10) {
      return 'တစ်နှစ်ပြည့်	ဆိတ်	2 ကောင်';
    } else if (totalKalaout >= 5) {
      return 'တစ်နှစ်ပြည့်	ဆိတ်	1 ကောင်';
    } else if (totalKalaout < 5) {
      return '';
    }
  }

  calcZakatForKywaeNwar(totalKywaeNwar) {
    var oneYear = 0;
    var twoYear = 0;

    var totalStep = 0;

    if (totalKywaeNwar > 120) {
      totalStep = int.parse(((totalKywaeNwar - 120) / 10).toStringAsFixed(0));
      twoYear = twoYear + 3;

      for (int i = 1; i <= totalStep; i++) {
        if (oneYear == 0) {
          oneYear = twoYear + 1;
          twoYear = 0;
        } else {
          oneYear = oneYear - 1;
          twoYear = twoYear + 1;
        }
      }

      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    }

    if (totalKywaeNwar <= 120 && totalKywaeNwar > 110) {
      twoYear = twoYear + 3;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar >= 110) {
      oneYear = oneYear + 1;
      twoYear = twoYear + 2;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar >= 100) {
      oneYear = oneYear + 2;
      twoYear = twoYear + 1;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar >= 90) {
      oneYear = oneYear + 3;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar >= 80) {
      twoYear = twoYear + 2;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar >= 70) {
      oneYear = oneYear + 1;
      twoYear = twoYear + 1;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar >= 60) {
      oneYear = oneYear + 2;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar >= 40) {
      twoYear = twoYear + 1;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar >= 30) {
      oneYear = oneYear + 1;
      return 'တစ်နှစ်ပြည့်	နွား	$oneYear ကောင်, နှစ်နှစ်ပြည့်	နွား	$twoYear ကောင်';
    } else if (totalKywaeNwar < 30) {
      return '';
    }
  }

  getRate(rate, usdRate) {
    print('************************');
    print({rate, usdRate});
    return (rate / 1.875) * usdRate;
  }
}
