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
    return goldPrice * 673.5;
  }

  silverZakatAmount(silver) {
    return silver * 4715.5;
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
      return 0;
    }
  }
}
