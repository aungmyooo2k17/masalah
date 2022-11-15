class Zakat {
  final String? zakatId;
  final double? goldAkhoutKyatthar;
  final double? goldAkhoutPae;
  final double? goldAkhoutYwae;
  final double? goldAhtaeKyatthar;
  final double? goldAhtaePae;
  final double? goldAhtaeYwae;
  final double? goldPyitceeKyatthar;
  final double? goldPyitceePae;
  final double? goldPyitceeYwae;
  final double? whiteSilverAkhoutKyatthar;
  final double? whiteSilverAkhoutPae;
  final double? whiteSilverAkhoutYwae;
  final double? whiteSilverAhtaeKyatthar;
  final double? whiteSilverAhtaePae;
  final double? whiteSilverAhtaeYwae;
  final double? whiteSilverPyitceeKyatthar;
  final double? whiteSilverPyitceePae;
  final double? whiteSilverPyitceeYwae;
  final double? silverAkhoutKyatthar;
  final double? silverAkhoutPae;
  final double? silverAkhoutYwae;
  final double? silverAhtaeKyatthar;
  final double? silverAhtaePae;
  final double? silverAhtaeYwae;
  final double? silverPyitceeKyatthar;
  final double? silverPyitceePae;
  final double? silverPyitceeYwae;
  final double? inHandSuHtarTaw;
  final double? inHandPyitceeSold;
  final double? inHandPyitceeBorrow;
  final double? inHandForeignCurrency;
  final double? inHandContract;
  final double? inHandOther;
  final double? inBankInBank;
  final double? inBankThuMyarHlwae;
  final double? inBankSalary;
  final double? inBankOther;
  final double? thuMyarDebtPyitceeSold;
  final double? thuMyarDebtChayPay;
  final double? thuMyarDebtAttHtrTaw;
  final double? thuMyarDebtOther;
  final double? realEstateSellHouse;
  final double? realEstateSellEscort;
  final double? realEstateSellCar;
  final double? realEstateOther;
  final double? rawWearhouse;
  final double? rawHome;
  final double? rawShop;
  final double? rawOther;
  final double? finishWearhouse;
  final double? finishHome;
  final double? finishShop;
  final double? finishAnimal;
  final double? finishOther;
  final double? sate;
  final double? thoe;
  final double? kalaout;
  final double? kywae;
  final double? nwar;
  final double? minusDebtMahur;
  final double? minusDebt;
  final double? minusSukyae;
  final double? minusMeterBill;
  final double? minusPaybill;
  final double? minusPaySalary;
  final double? minusPayRent;
  final double? minusBuyGoodPay;
  final double? minusPreZakat;
  final String? createdAt;
  final String? updatedAt;
  final double? goldRate;
  final double? silverRate;
  final double? yourZakat;
  final double? yourWorth;
  final String? yourZakatAnimal;

  Zakat(
      {this.zakatId,
      this.goldAkhoutKyatthar,
      this.goldAkhoutPae,
      this.goldAkhoutYwae,
      this.goldAhtaeKyatthar,
      this.goldAhtaePae,
      this.goldAhtaeYwae,
      this.goldPyitceeKyatthar,
      this.goldPyitceePae,
      this.goldPyitceeYwae,
      this.whiteSilverAkhoutKyatthar,
      this.whiteSilverAkhoutPae,
      this.whiteSilverAkhoutYwae,
      this.whiteSilverAhtaeKyatthar,
      this.whiteSilverAhtaePae,
      this.whiteSilverAhtaeYwae,
      this.whiteSilverPyitceeKyatthar,
      this.whiteSilverPyitceePae,
      this.whiteSilverPyitceeYwae,
      this.silverAkhoutKyatthar,
      this.silverAkhoutPae,
      this.silverAkhoutYwae,
      this.silverAhtaeKyatthar,
      this.silverAhtaePae,
      this.silverAhtaeYwae,
      this.silverPyitceeKyatthar,
      this.silverPyitceePae,
      this.silverPyitceeYwae,
      this.inHandSuHtarTaw,
      this.inHandPyitceeSold,
      this.inHandPyitceeBorrow,
      this.inHandForeignCurrency,
      this.inHandContract,
      this.inHandOther,
      this.inBankInBank,
      this.inBankThuMyarHlwae,
      this.inBankSalary,
      this.inBankOther,
      this.thuMyarDebtPyitceeSold,
      this.thuMyarDebtChayPay,
      this.thuMyarDebtAttHtrTaw,
      this.thuMyarDebtOther,
      this.realEstateSellHouse,
      this.realEstateSellEscort,
      this.realEstateSellCar,
      this.realEstateOther,
      this.rawWearhouse,
      this.rawHome,
      this.rawShop,
      this.rawOther,
      this.finishWearhouse,
      this.finishHome,
      this.finishShop,
      this.finishAnimal,
      this.finishOther,
      this.sate,
      this.thoe,
      this.kalaout,
      this.kywae,
      this.nwar,
      this.minusDebtMahur,
      this.minusDebt,
      this.minusSukyae,
      this.minusMeterBill,
      this.minusPaybill,
      this.minusPaySalary,
      this.minusPayRent,
      this.minusBuyGoodPay,
      this.minusPreZakat,
      this.createdAt,
      this.updatedAt,
      this.goldRate,
      this.silverRate,
      this.yourZakat,
      this.yourWorth,
      this.yourZakatAnimal});

  factory Zakat.fromJson(Map<String, dynamic> json) => Zakat(
        zakatId: json['zakatId'],
        goldAkhoutKyatthar: json['goldAkhoutKyatthar'],
        goldAkhoutPae: json['goldAkhoutPae'],
        goldAkhoutYwae: json['goldAkhoutYwae'],
        goldAhtaeKyatthar: json['goldAhtaeKyatthar'],
        goldAhtaePae: json['goldAhtaePae'],
        goldAhtaeYwae: json['goldAhtaeYwae'],
        goldPyitceeKyatthar: json['goldPyitceeKyatthar'],
        goldPyitceePae: json['goldPyitceePae'],
        goldPyitceeYwae: json['goldPyitceeYwae'],
        whiteSilverAkhoutKyatthar: json['whiteSilverAkhoutKyatthar'],
        whiteSilverAkhoutPae: json['whiteSilverAkhoutPae'],
        whiteSilverAkhoutYwae: json['whiteSilverAkhoutYwae'],
        whiteSilverAhtaeKyatthar: json['whiteSilverAhtaeKyatthar'],
        whiteSilverAhtaePae: json['whiteSilverAhtaePae'],
        whiteSilverAhtaeYwae: json['whiteSilverAhtaeYwae'],
        whiteSilverPyitceeKyatthar: json['whiteSilverPyitceeKyatthar'],
        whiteSilverPyitceePae: json['whiteSilverPyitceePae'],
        whiteSilverPyitceeYwae: json['whiteSilverPyitceeYwae'],
        silverAkhoutKyatthar: json['silverAkhoutKyatthar'],
        silverAkhoutPae: json['silverAkhoutPae'],
        silverAkhoutYwae: json['silverAkhoutYwae'],
        silverAhtaeKyatthar: json['silverAhtaeKyatthar'],
        silverAhtaePae: json['silverAhtaePae'],
        silverAhtaeYwae: json['silverAhtaeYwae'],
        silverPyitceeKyatthar: json['silverPyitceeKyatthar'],
        silverPyitceePae: json['silverPyitceePae'],
        silverPyitceeYwae: json['silverPyitceeYwae'],
        inHandSuHtarTaw: json['inHandSuHtarTaw'],
        inHandPyitceeSold: json['inHandPyitceeSold'],
        inHandPyitceeBorrow: json['inHandPyitceeBorrow'],
        inHandForeignCurrency: json['inHandForeignCurrency'],
        inHandContract: json['inHandContract'],
        inHandOther: json['inHandOther'],
        inBankInBank: json['inBankInBank'],
        inBankThuMyarHlwae: json['inBankThuMyarHlwae'],
        inBankSalary: json['inBankSalary'],
        inBankOther: json['inBankOther'],
        thuMyarDebtPyitceeSold: json['thuMyarDebtPyitceeSold'],
        thuMyarDebtChayPay: json['thuMyarDebtChayPay'],
        thuMyarDebtAttHtrTaw: json['thuMyarDebtAttHtrTaw'],
        thuMyarDebtOther: json['thuMyarDebtOther'],
        realEstateSellHouse: json['realEstateSellHouse'],
        realEstateSellEscort: json['realEstateSellEscort'],
        realEstateSellCar: json['realEstateSellCar'],
        realEstateOther: json['realEstateOther'],
        rawWearhouse: json['rawWearhouse'],
        rawHome: json['rawHome'],
        rawShop: json['rawShop'],
        rawOther: json['rawOther'],
        finishWearhouse: json['finishWearhouse'],
        finishHome: json['finishHome'],
        finishShop: json['finishShop'],
        finishAnimal: json['finishAnimal'],
        finishOther: json['finishOther'],
        sate: json['sate'],
        thoe: json['thoe'],
        kalaout: json['kalaout'],
        kywae: json['kywae'],
        nwar: json['nwar'],
        minusDebtMahur: json['minusDebtMahur'],
        minusDebt: json['minusDebt'],
        minusSukyae: json['minusSukyae'],
        minusMeterBill: json['minusMeterBill'],
        minusPaybill: json['minusPaybill'],
        minusPaySalary: json['minusPaySalary'],
        minusPayRent: json['minusPayRent'],
        minusBuyGoodPay: json['minusBuyGoodPay'],
        minusPreZakat: json['minusPreZakat'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        goldRate: json['goldRate'],
        silverRate: json['silverRate'],
        yourZakat: json['yourZakat'],
        yourWorth: json['yourWorth'],
        yourZakatAnimal: json['yourZakatAnimal'],
      );

  Map<String, dynamic> toJson() => {
        "zakatId": zakatId,
        "goldAkhoutKyatthar": goldAkhoutKyatthar,
        "goldAkhoutPae": goldAkhoutPae,
        "goldAkhoutYwae": goldAkhoutYwae,
        "goldAhtaeKyatthar": goldAhtaeKyatthar,
        "goldAhtaePae": goldAhtaePae,
        "goldAhtaeYwae": goldAhtaeYwae,
        "goldPyitceeKyatthar": goldPyitceeKyatthar,
        "goldPyitceePae": goldPyitceePae,
        "goldPyitceeYwae": goldPyitceeYwae,
        "whiteSilverAkhoutKyatthar": whiteSilverAkhoutKyatthar,
        "whiteSilverAkhoutPae": whiteSilverAkhoutPae,
        "whiteSilverAkhoutYwae": whiteSilverAkhoutYwae,
        "whiteSilverAhtaeKyatthar": whiteSilverAhtaeKyatthar,
        "whiteSilverAhtaePae": whiteSilverAhtaePae,
        "whiteSilverAhtaeYwae": whiteSilverAhtaeYwae,
        "whiteSilverPyitceeKyatthar": whiteSilverPyitceeKyatthar,
        "whiteSilverPyitceePae": whiteSilverPyitceePae,
        "whiteSilverPyitceeYwae": whiteSilverPyitceeYwae,
        "silverAkhoutKyatthar": silverAkhoutKyatthar,
        "silverAkhoutPae": silverAkhoutPae,
        "silverAkhoutYwae": silverAkhoutYwae,
        "silverAhtaeKyatthar": silverAhtaeKyatthar,
        "silverAhtaePae": silverAhtaePae,
        "silverAhtaeYwae": silverAhtaeYwae,
        "silverPyitceeKyatthar": silverPyitceeKyatthar,
        "silverPyitceePae": silverPyitceePae,
        "silverPyitceeYwae": silverPyitceeYwae,
        "inHandSuHtarTaw": inHandSuHtarTaw,
        "inHandPyitceeSold": inHandPyitceeSold,
        "inHandPyitceeBorrow": inHandPyitceeBorrow,
        "inHandForeignCurrency": inHandForeignCurrency,
        "inHandContract": inHandContract,
        "inHandOther": inHandOther,
        "inBankInBank": inBankInBank,
        "inBankThuMyarHlwae": inBankThuMyarHlwae,
        "inBankSalary": inBankSalary,
        "inBankOther": inBankOther,
        "thuMyarDebtPyitceeSold": thuMyarDebtPyitceeSold,
        "thuMyarDebtChayPay": thuMyarDebtChayPay,
        "thuMyarDebtAttHtrTaw": thuMyarDebtAttHtrTaw,
        "thuMyarDebtOther": thuMyarDebtOther,
        "realEstateSellHouse": realEstateSellHouse,
        "realEstateSellEscort": realEstateSellEscort,
        "realEstateSellCar": realEstateSellCar,
        "realEstateOther": realEstateOther,
        "rawWearhouse": rawWearhouse,
        "rawHome": rawHome,
        "rawShop": rawShop,
        "rawOther": rawOther,
        "finishWearhouse": finishWearhouse,
        "finishHome": finishHome,
        "finishShop": finishShop,
        "finishAnimal": finishAnimal,
        "finishOther": finishOther,
        "sate": sate,
        "thoe": thoe,
        "kalaout": kalaout,
        "kywae": kywae,
        "nwar": nwar,
        "minusDebtMahur": minusDebtMahur,
        "minusDebt": minusDebt,
        "minusSukyae": minusSukyae,
        "minusMeterBill": minusMeterBill,
        "minusPaybill": minusPaybill,
        "minusPaySalary": minusPaySalary,
        "minusPayRent": minusPayRent,
        "minusBuyGoodPay": minusBuyGoodPay,
        "minusPreZakat": minusPreZakat,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "goldRate": goldRate,
        "silverRate": silverRate,
        "yourZakat": yourZakat,
        "yourWorth": yourWorth,
        "yourZakatAnimal": yourZakatAnimal,
      };
}
