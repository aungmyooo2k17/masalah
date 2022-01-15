class ZakatCalculatorUtil {
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

  getTotalGoldPlatinum(
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

  getTotalSilverMoneyOther(
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

  getTotalMinus(
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
