import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'money_zakat.dart';
import 'gold_zakat.dart';
import 'agriculture_zakat.dart';
import 'business_zakat.dart';
import 'livestock_zakat.dart';

void main() {
  runApp(ZakatApp());
}

class ZakatApp extends StatelessWidget {
  const ZakatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Arial'),
      home: HomeScreen(),
      routes: {
        '/money': (context) => MoneyZakatPage(),
        '/gold': (context) => GoldZakatPage(),
        '/agriculture': (context) => AgricultureZakatPage(),
        '/business': (context) => BusinessZakatPage(),
        '/livestock': (context) => LivestockZakatPage(),
      },
    );
  }
}
