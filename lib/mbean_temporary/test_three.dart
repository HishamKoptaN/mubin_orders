import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppSelectNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp Contact Picker Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _openWhatsAppContactPicker();
            },
            child: const Text('Open WhatsApp Contact Picker'),
          ),
        ),
      ),
    );
  }

  // الدالة لفتح تطبيق واتساب لتحديد جهة الاتصال
  _openWhatsAppContactPicker() async {
    // قم بتغيير الرقم بالرقم الذي تريد إرسال الرسالة إليه
    String phoneNumber = '1234567890';

    // تكوين الرابط لفتح تطبيق واتساب وتحديد جهة الاتصال
    String url = 'https://wa.me/$phoneNumber';

    // فتح التطبيق
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
