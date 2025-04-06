import 'package:flutter/material.dart';
import 'package:prayer_time/providers/PrayerTimeProvider.dart';
import 'package:prayer_time/widgets/PrayerTimeCard.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prayer Times')),
      body:   Consumer<PrayerTimeProvider>(builder: (context, value, child) {
        var data = value.prayerTimes?.data;
        if(data == null)
        {
           value.fetchPrayerTimes();
          return const Center(child: CircularProgressIndicator());
        }else
        {
          return ListView.separated(
            itemBuilder: (context, index) {

                return PrayerTimeCard(prayerName: data.keys.elementAt(index).toString(), prayerTime:data.values.elementAt(index).toString());

            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: 10,



          );
        }
      },)

    );
    }
  }





