import 'package:flutter/material.dart';
import 'package:app_flutter_ramadhan/core/components/spaces.dart';
import 'package:app_flutter_ramadhan/core/constants/colors.dart';
import 'package:hijriyah_indonesia/hijriyah_indonesia.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SpaceHeight(42.0),
          Container(
            padding: const EdgeInsets.all(20.0),
            height: 320.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage(
                  DateTime.now().hour >= 4 && DateTime.now().hour < 16
                      ? 'assets/images/duhur.png' // Jam 6 pagi - 6 sore
                      : 'assets/images/banner.png', // Jam 6 sore - 6 pagi
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jawa Tengah, Indonesia',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Hari ini',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                    // SizedBox(height: 10.0),
                    Text(
                      Hijriyah.fromDate(
                        DateTime.now().toLocal(),
                      ).toFormat("dd MMMM yyyy"),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Magrib",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "18:00",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const AdhanPage()));
                    },
                    child: const Text('Lihat Semua'),
                  ),
                ),
              ],
            ),
          ),
          SpaceHeight(24.0),
          Row(
            children: [
              Text(
                'Bacaan Al-Qur\'an Terakhir',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // if (lastRead != null) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => VersesScreen.ofSurah(
                  //         Quran.getSurah(lastRead!['surah']!),
                  //         lastReading: true,
                  //       ),
                  //     ),
                  //   );
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text(
                  //         "Belum ada bacaan terakhir",
                  //         style: TextStyle(
                  //           color: AppColors.black,
                  //         ),
                  //       ),
                  //       backgroundColor: AppColors.white,
                  //     ),
                  //   );
                  // }
                },
                child: const Text(
                  'Lanjut Baca',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.transparent,
                child: ListTile(
                  title: Text(
                    'Ayat',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Terjemah',
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
              );
            },
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
          SpaceHeight(24.0),
        ],
      ),
    );
  }
}
