import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/profile.png'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'Ari Surya Ramadhan',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Kota Tangerang, Banten | 081389737060',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: const Text(
              'Tentang saya',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Saya adalah lulusan S1 Sistem Komputer, '
              'semasa kuliah saya mempelajari Algoritma Pemrograman, '
              'Microcontroller, Internet of Things, Struktur Data '
              'dan yang lainnya. Kesibukan saya saat ini adalah mencari '
              'kerja dan meningkatkan skill dibidang yang saya minati '
              'yaitu Flutter',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: const Text(
              'Skill',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Dart | Flutter | Firebase | Postman | Sqflite'
              '\nState Management : BloC dan Getx.\n'
              'Architecture Pattern : MVC dan Clean Architecture.\n'
              'Automated Testing : Unit Testing, '
              'UI Testing dan BloC Testing.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: const Text(
              'Portofolio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Muslim App',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () async => await launchUrl(Uri.parse('https://github.com/arisuryar/MuslimApp')),
                      child: const Text(
                        'Klik disini',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  "Aplikasi yang digunakan untuk membaca Al-Qur'an, Doa, Hadits dan terdapat jadwal Sholat",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'News App',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () async => await launchUrl(Uri.parse('https://github.com/arisuryar/news_app')),
                      child: const Text(
                        'Klik disini',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  "Aplikasi yang digunakan untuk membaca dan mencari berita",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Todo App',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () async => await launchUrl(Uri.parse('https://github.com/arisuryar/ToDoApp')),
                      child: const Text(
                        'Klik disini',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  "Aplikasi yang digunakan untuk mencatat kegiatan atau aktifitas harian",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
