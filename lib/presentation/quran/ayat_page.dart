import 'package:flutter/material.dart';
import 'package:app_flutter_ramadhan/core/constants/colors.dart';
import 'package:app_flutter_ramadhan/core/extensions/build_context_ext.dart';
import 'package:app_flutter_ramadhan/presentation/quran/widgets/ayat_widget.dart';
import 'package:quran_flutter/quran_flutter.dart';

class AyatPage extends StatefulWidget {
  final Surah? surah;
  final Juz? juz;
  final QuranPage? page;
  final bool lastReading;

  const AyatPage({
    super.key,
    this.surah,
    this.juz,
    this.page,
    this.lastReading = false,
  });

  factory AyatPage.ofSurah(Surah surah, {bool lastReading = false}) =>
      AyatPage(surah: surah, lastReading: lastReading);

  @override
  State<AyatPage> createState() => _AyatPageState();
}

class _AyatPageState extends State<AyatPage> {
  Surah? surah;
  Juz? juz;
  QuranPage? page;
  final List<dynamic> surahVersList = [];
  QuranLanguage translationLanguage = QuranLanguage.indonesian;
  Map<int, Map<int, Verse>> translatedVerses = {};
  // ItemScrollController itemScrollController = ItemScrollController();
  int lastReadIndex = 0;

  @override
  void initState() {
    surah = widget.surah;
    juz = widget.juz;
    page = widget.page;
    translatedVerses = Quran.getQuranVerses(language: translationLanguage);
    surahVersList.add(widget.surah);
    surahVersList.addAll(Quran.getSurahVersesAsList(widget.surah!.number));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Ayat', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          dynamic item = surahVersList[index];
          if (item is Surah) {
            return const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                Quran.bismillah,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Uthmanic',
                ),
              ),
            );
          } else if (item is Verse) {
            return GestureDetector(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Simpan Bacaan Terakhir"),
                      content: Text(
                        "Apakah Anda ingin menyimpan bacaan terakhir di Surah , Ayat ${item.verseNumber}?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                          },
                          child: Text("Batal"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Bacaan terakhir disimpan!",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: Colors.white,
                              ),
                            );
                          },
                          child: Text("Simpan"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: AyatWidget(
                verse: item,
                translationLanguage: translationLanguage,
                translatedVerses: translatedVerses,
              ),
            );
          } else {
            return Container();
          }
        },
        itemCount: surahVersList.length,
      ),
    );
  }
}
