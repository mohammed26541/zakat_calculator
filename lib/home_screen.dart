import 'package:flutter/material.dart';
import 'money_zakat.dart';
import 'gold_zakat.dart';
import 'agriculture_zakat.dart';
import 'business_zakat.dart';
import 'livestock_zakat.dart';
import 'warning_screen.dart';
import 'route_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade800, Colors.green.shade400],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '💰 حساب الزكاة',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'اختر نوع الزكاة لحسابها:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _buildZakatCard(
                        context,
                        '💰 زكاة المال',
                        Icons.monetization_on,
                        Colors.green,
                        MoneyZakatPage(),
                      ),
                      _buildZakatCard(
                        context,
                        '🏅 زكاة الذهب',
                        Icons.account_balance,
                        Colors.amber,
                        GoldZakatPage(),
                      ),
                      _buildZakatCard(
                        context,
                        '🌾 زكاة الزروع والثمار',
                        Icons.grass,
                        Colors.green,
                        AgricultureZakatPage(),
                      ),
                      _buildZakatCard(
                        context,
                        '🏪 زكاة التجارة',
                        Icons.store,
                        Colors.blue,
                        BusinessZakatPage(),
                      ),
                      _buildZakatCard(
                        context,
                        '🐄 زكاة الأنعام',
                        Icons.pets,
                        Colors.brown,
                        LivestockZakatPage(),
                      ),
                      _buildZakatCard(
                        context,
                        '⚠️ ملاحظة هامة',
                        Icons.warning_amber,
                        Colors.orange,
                        WarningScreen(),
                      ), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildZakatCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          SlidePageRoute(page: page),
        ); 
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(230),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
