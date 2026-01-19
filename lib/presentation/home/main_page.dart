import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:alarm/model/notification_settings.dart';
import 'package:alarm/model/volume_settings.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_ramadhan/core/constants/colors.dart';
import 'package:app_flutter_ramadhan/presentation/home/home_page.dart';
import 'package:app_flutter_ramadhan/presentation/home/widgets/nav_item.dart';
import 'package:app_flutter_ramadhan/presentation/quran/alquran_page.dart';
import 'package:app_flutter_ramadhan/presentation/sholat/sholat_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SholatPage(),
    const AlQuranPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // final alarmSettings = AlarmSettings(
  //   id: 42,
  //   dateTime: DateTime.now().add(const Duration(seconds: 10)),
  //   assetAudioPath: 'assets/audios/mecca.mp3',
  //   loopAudio: true,
  //   vibrate: true,
  //   warningNotificationOnKill: Platform.isIOS,
  //   androidFullScreenIntent: true,
  //   volumeSettings: VolumeSettings.fixed(volume: 0.8, volumeEnforced: true),
  //   notificationSettings: const NotificationSettings(
  //     title: 'Adzan Magbrib',
  //     body: 'Masuk Waktu Adzan Magbrib untuk Kab Sleman',
  //     stopButton: 'Tutup',
  //     icon: 'notification_icon',
  //   ),
  // );

  @override
  void initState() {
    // Alarm.set(alarmSettings: alarmSettings).then((value) {
    //   print('Alarm set: $value');
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 16,
          top: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 30.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              iconPath: 'assets/icons/ramadan.png',
              label: 'Hari ini',
              isActive: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            NavItem(
              iconPath: 'assets/icons/mosque.png',
              label: 'Sholat',
              isActive: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                // context.push(const OrdersPage());
              },
            ),
            NavItem(
              iconPath: 'assets/icons/quran.png',
              label: 'Al-Quran',
              isActive: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}
