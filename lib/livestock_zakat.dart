import 'package:flutter/material.dart';

class LivestockZakatPage extends StatefulWidget {
  const LivestockZakatPage({super.key});

  @override
  State<LivestockZakatPage> createState() => _LivestockZakatPageState();
}

class _LivestockZakatPageState extends State<LivestockZakatPage> {
  final TextEditingController _camelsController = TextEditingController();
  final TextEditingController _cowsController = TextEditingController();
  final TextEditingController _sheepController = TextEditingController();

  String zakatResult = "";

  void calculateZakat() {
    int camels = int.tryParse(_camelsController.text) ?? 0;
    int cows = int.tryParse(_cowsController.text) ?? 0;
    int sheep = int.tryParse(_sheepController.text) ?? 0;

    String result = "";

    // حساب زكاة الإبل
    if (camels >= 5) {
      if (camels < 10) {
        result += "🐫 زكاة الإبل: شاه واحدة\n";
      } else if (camels < 15) {
        result += "🐫 زكاة الإبل: شاتان\n";
      } else if (camels < 20) {
        result += "🐫 زكاة الإبل: ثلاث شياه\n";
      } else if (camels < 25) {
        result += "🐫 زكاة الإبل: أربع شياه\n";
      } else {
        result += "🐫 زكاة الإبل: بنت مخاض أو ما يعادلها\n";
      }
    }

    // حساب زكاة البقر
    if (cows >= 30) {
      if (cows < 40) {
        result += "🐄 زكاة البقر: تبيع واحد (سنة واحدة)\n";
      } else if (cows < 60) {
        result += "🐄 زكاة البقر: مسنة (سنتان)\n";
      } else {
        result += "🐄 زكاة البقر: لكل 30 تبيع، ولكل 40 مسنة\n";
      }
    }

    // حساب زكاة الغنم
    if (sheep >= 40) {
      if (sheep < 121) {
        result += "🐑 زكاة الغنم: شاه واحدة\n";
      } else if (sheep < 201) {
        result += "🐑 زكاة الغنم: شاتان\n";
      } else if (sheep < 400) {
        result += "🐑 زكاة الغنم: ثلاث شياه\n";
      } else {
        result += "🐑 زكاة الغنم: لكل 100 شاه واحدة\n";
      }
    }

    setState(() {
      zakatResult = result.isEmpty ? "لا زكاة على الأنعام المدخلة" : result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🐄 زكاة الأنعام')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.brown.shade800, Colors.brown.shade500],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _camelsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'عدد الإبل',
                    prefixIcon: Icon(Icons.cabin, color: Colors.brown),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _cowsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'عدد الأبقار',
                    prefixIcon: Icon(Icons.agriculture, color: Colors.brown),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _sheepController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'عدد الأغنام',
                    prefixIcon: Icon(Icons.pets, color: Colors.brown),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateZakat,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.brown.shade800,
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('حساب الزكاة'),
                ),
                SizedBox(height: 20),
                if (zakatResult.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(230),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '📜 نتيجة حساب الزكاة:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          zakatResult,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown.shade800,
                          ),
                          textAlign: TextAlign.center,
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
