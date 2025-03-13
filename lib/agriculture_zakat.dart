import 'package:flutter/material.dart';

class AgricultureZakatPage extends StatefulWidget {
  const AgricultureZakatPage({super.key});

  @override
  State<AgricultureZakatPage> createState() => _AgricultureZakatPageState();
}

class _AgricultureZakatPageState extends State<AgricultureZakatPage> {
  final TextEditingController _cropWeightController = TextEditingController();
  double zakatAmount = 0.0;
  double zakatPercentage = 0.10; // 10% للري الطبيعي

  void calculateZakat() {
    double cropWeight = double.tryParse(_cropWeightController.text) ?? 0.0;
    setState(() {
      zakatAmount = cropWeight * zakatPercentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🌾 زكاة الزروع والثمار')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade800, Colors.green.shade500],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _cropWeightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'أدخل وزن المحصول (بالكيلو)',
                    prefixIcon: Icon(Icons.agriculture, color: Colors.green),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<double>(
                        title: Text('ري طبيعي (10%)'),
                        value: 0.10,
                        groupValue: zakatPercentage,
                        onChanged: (value) {
                          setState(() {
                            zakatPercentage = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<double>(
                        title: Text('ري صناعي (5%)'),
                        value: 0.05,
                        groupValue: zakatPercentage,
                        onChanged: (value) {
                          setState(() {
                            zakatPercentage = value!;
                          });
                        },
                      ),
                    ),
                  ],
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
                          '🌾 قيمة الزكاة المستحقة:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${zakatAmount.toStringAsFixed(2)} كيلو جرام',
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
