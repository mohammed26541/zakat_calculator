import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // ✅ لاستدعاء واتساب
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WarningScreen extends StatelessWidget {
  const WarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('⚠️ ملاحظة هامة'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning, size: 80, color: Colors.orange.shade800),
            SizedBox(height: 20),
            Text(
              '📢 هذا التطبيق اجتهاد شخصي لحساب الزكاة. قد تحدث أخطاء، لذا يُفضل مراجعة مصدر موثوق أو استشارة مختص في الفقه الإسلامي.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              '💡 تأكد دائمًا من صحة الحسابات قبل إخراج الزكاة!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25), // ✅ مسافة صغيرة قبل الزر
            Text(
              '📞 في حالة وجود أي خطأ أو استفسار، يُرجى التواصل على الواتساب.\nكان معكم أخوكم محمد سعيدابراهيم من جزيرة الوراق  🤍',
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                _openWhatsApp();
              },
              icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
              label: Text('تواصل عبر واتساب'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openWhatsApp() async {
    String phoneNumber = "+201203791667";
    Uri url = Uri.parse("https://wa.me/$phoneNumber");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print("❌ لا يمكن فتح واتساب");
    }
  }
}
