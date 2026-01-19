import 'package:flutter/material.dart';
import 'package:app_flutter_ramadhan/core/components/spaces.dart';
import 'package:app_flutter_ramadhan/core/constants/colors.dart';

class SholatPage extends StatefulWidget {
  const SholatPage({super.key});

  @override
  State<SholatPage> createState() => _SholatPageState();
}

class _SholatPageState extends State<SholatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Sholat', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2050),
                // initialDate: selectedDate, // Menggunakan tanggal saat ini
              );
            },
            icon: const Icon(Icons.calendar_month, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Kota Magelang',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              SpaceWidth(10),
              IconButton(
                onPressed: () {
                  // log("Referesh Location");
                  // refreshLocation();
                },
                icon: const Icon(Icons.refresh, color: Colors.white),
              ),
            ],
          ),
          SpaceHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
              Text(
                'Hari ini, 10 Mar 2025',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ],
          ),
          SpaceHeight(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Imsak',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  '03:30',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subuh',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  '04:00',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Terbit',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  '06:00',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dzuhur',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  '12:00',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ashar',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  '15:00',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Maghrib',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  '18:00',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Isya',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  '19:00',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
