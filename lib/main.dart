import 'package:flutter/material.dart';
import 'package:tugas_8/about.dart';
import 'package:tugas_8/biodata.dart';
import 'package:tugas_8/home.dart';
import 'package:tugas_8/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Modul 8',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/biodata': (context) => const BiodataPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}

//Muhammad Fadli Hidayatullah - 20104088