import 'package:flutter/cupertino.dart';
import '../models/PrayerTimeModel.dart';
import '../services/PrayerTimeService.dart';

class PrayerTimeProvider with ChangeNotifier {
  PrayerTimeModel? prayerTimes;


  Future<void> fetchPrayerTimes() async {
    prayerTimes = await PrayerTimeService.getPrayerTimes();
    notifyListeners();
  }
}
