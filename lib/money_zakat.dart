import 'package:flutter/material.dart';

class MoneyZakatPage extends StatefulWidget {
  const MoneyZakatPage({super.key});

  @override
  State<MoneyZakatPage> createState() => _MoneyZakatPageState();
}

class _MoneyZakatPageState extends State<MoneyZakatPage> {
  final TextEditingController _moneyController = TextEditingController();
  double zakatAmount = 0.0;

  void calculateZakat() {
    double money = double.tryParse(_moneyController.text) ?? 0.0;
    setState(() {
      zakatAmount = money >= 8575 ? money * 0.025 : 0.0; // نصاب الزكاة التقريبي
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('💰 زكاة المال')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade800, Colors.green.shade400],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _moneyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'أدخل المبلغ الكلي (بالجنيه)',
                    prefixIcon: Icon(Icons.money, color: Colors.green),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateZakat,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green.shade800,
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
                          '💰 قيمة الزكاة المستحقة:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${zakatAmount.toStringAsFixed(2)} جنيه',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green.shade800),
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
