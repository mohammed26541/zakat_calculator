import 'package:flutter/material.dart';

class GoldZakatPage extends StatefulWidget {
  const GoldZakatPage({super.key});

  @override
  State<GoldZakatPage> createState() => _GoldZakatPageState();
}

class _GoldZakatPageState extends State<GoldZakatPage> {
  final TextEditingController _goldController = TextEditingController();
  double zakatAmount = 0.0;
  static const double nisabGold = 85; // نصاب الذهب بالجرام

  void calculateZakat() {
    double goldWeight = double.tryParse(_goldController.text) ?? 0.0;
    setState(() {
      zakatAmount = (goldWeight >= nisabGold) ? goldWeight * 0.025 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🏅 زكاة الذهب')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.amber.shade700, Colors.amber.shade400],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _goldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'أدخل وزن الذهب (بالجرام)',
                    prefixIcon: Icon(Icons.account_balance, color: Colors.amber),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateZakat,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.amber.shade700,
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('حساب الزكاة'),
                ),
                SizedBox(height: 20),
                if (zakatAmount > 0)
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(230),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '🏅 قيمة الزكاة المستحقة:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${zakatAmount.toStringAsFixed(2)} جرام من الذهب',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber.shade700),
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
}
