import 'package:flutter/material.dart';

class BusinessZakatPage extends StatefulWidget {
  const BusinessZakatPage({super.key});

  @override
  State<BusinessZakatPage> createState() => _BusinessZakatPageState();
}

class _BusinessZakatPageState extends State<BusinessZakatPage> {
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _profitsController = TextEditingController();
  double zakatAmount = 0.0;
  static const double zakatRate = 0.025; // نسبة الزكاة 2.5%

  void calculateZakat() {
    double capital = double.tryParse(_capitalController.text) ?? 0.0;
    double profits = double.tryParse(_profitsController.text) ?? 0.0;
    setState(() {
      zakatAmount = (capital + profits) * zakatRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🏪 زكاة التجارة')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade500],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _capitalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'رأس المال (بالجنيه)',
                    prefixIcon: Icon(Icons.account_balance_wallet, color: Colors.blue),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _profitsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'الأرباح السنوية (بالجنيه)',
                    prefixIcon: Icon(Icons.attach_money, color: Colors.blue),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateZakat,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
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
                          '🏪 قيمة الزكاة المستحقة:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${zakatAmount.toStringAsFixed(2)} جنيه مصري',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
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
