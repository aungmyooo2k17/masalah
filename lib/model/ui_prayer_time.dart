class UiPrayerTimeItem {
  final String name;
  final String currentPrayerTime;
  final bool isCurrentPrayerTime ;
  final bool isMuteForCurrentPrayer;

  UiPrayerTimeItem(
      {required this.name,
      required this.currentPrayerTime,
      this.isCurrentPrayerTime = false,
      required this.isMuteForCurrentPrayer});
}

class UiPrayerTimeItemCard {
  final UiPrayerTimeItem currentPrayerTimeItem;
  final String currentPrayerImage;
  final String nextPrayerName;
  final String nextPrayerTime;

  UiPrayerTimeItemCard(
      {required this.currentPrayerTimeItem,
      required this.nextPrayerName,
      required this.nextPrayerTime,
      required this.currentPrayerImage});
}

calculatingCurrentPrayerTime() {}

//  Map<String, dynamic> calculatingCurrentPrayerTime() {
//     print("fajir - ${prayerTimeNow!.fajr}");
//     print("s - ${prayerTimeNow!.sunrise}");
//     print("d - ${prayerTimeNow!.dhuhr}");
//     print("a - ${prayerTimeNow!.asr}");
//     print("m - ${prayerTimeNow!.maghrib}");
//     print("i - ${prayerTimeNow!.isha}");
//     print(DateTime.now());
//     print(prayerTimeNow!.maghrib.isAfter(DateTime.now()));
//     print(prayerTimeNow!.maghrib.isAfter(DateTime.now()) &&
//         prayerTimeNow!.asr.isBefore(DateTime.now()));

//     Map<String, dynamic> myObject = {
//       'name': null,
//       'time': null,
//       'nName': null,
//       'nTime': null,
//       'image': null
//     };
//     if (prayerTimeNow!.fajr.isAfter(DateTime.now())) {
//       myObject = {
//         'name': "Isha",
//         'time': prayerTimeNow!.isha,
//         'nName': "Fajr",
//         'nTime': prayerTimeNow!.fajr,
//         'image': AssetImage("assets/images/Isha.png")
//       };
//     }

//     if (prayerTimeNow!.sunrise.isAfter(DateTime.now()) &&
//         prayerTimeNow!.fajr.isBefore(DateTime.now())) {
//       myObject = {
//         'name': "Fajr",
//         'time': prayerTimeNow!.fajr,
//         'nName': "Sunrise",
//         'nTime': prayerTimeNow!.sunrise,
//         'image': AssetImage("assets/images/Fajr.png")
//       };
//     }

//     if (prayerTimeNow!.dhuhr.isAfter(DateTime.now()) &&
//         prayerTimeNow!.sunrise.isBefore(DateTime.now())) {
//       myObject = {
//         'name': "Sunrise",
//         'time': prayerTimeNow!.sunrise,
//         'nName': "Duhur",
//         'nTime': prayerTimeNow!.dhuhr,
//         'image': AssetImage("assets/images/sunrise.png")
//       };
//     }

//     if (prayerTimeNow!.asr.isAfter(DateTime.now()) &&
//         prayerTimeNow!.dhuhr.isBefore(DateTime.now())) {
//       myObject = {
//         'name': "Duhur",
//         'time': prayerTimeNow!.dhuhr,
//         'nName': "Asr",
//         'nTime': prayerTimeNow!.asr,
//         'image': AssetImage("assets/images/Duhr.png")
//       };
//     }

//     if (prayerTimeNow!.maghrib.isAfter(DateTime.now()) &&
//         prayerTimeNow!.asr.isBefore(DateTime.now())) {
//       myObject = {
//         'name': "Asr",
//         'time': prayerTimeNow!.asr,
//         'nName': "Magrib",
//         'nTime': prayerTimeNow!.maghrib,
//         'image': AssetImage("assets/images/Asir.png")
//       };
//     }

//     if (prayerTimeNow!.isha.isAfter(DateTime.now()) &&
//         prayerTimeNow!.maghrib.isBefore(DateTime.now())) {
//       myObject = {
//         'name': "Magrib",
//         'time': prayerTimeNow!.maghrib,
//         'nName': "Isha",
//         'nTime': prayerTimeNow!.isha,
//         'image': AssetImage("assets/images/magrib.png")
//       };
//     }

//     if (!prayerTimeNow!.isha.isAfter(DateTime.now())) {
//       myObject = {
//         'name': "Isha",
//         'time': prayerTimeNow!.isha,
//         'nName': "Fajr",
//         'nTime': prayerTimeNow!.fajr,
//         'image': AssetImage("assets/images/Isha.png")
//       };
//     }

//     return myObject;
//   }
