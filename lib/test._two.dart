import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class MyAppTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Desktop Video Share',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> downloadAndShareVideo(String url) async {
    try {
      // إظهار إشعار لتحميل الفيديو
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloading video...')),
      );

      // الحصول على دليل المستندات
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/video.mp4');

      // تنزيل الفيديو من الرابط
      final response = await http.get(Uri.parse(url));
      await file.writeAsBytes(response.bodyBytes);

      // مشاركة الفيديو
      await Share.shareFiles(
        [file.path],
        text: 'Check out this video!',
      );

      // إظهار إشعار لإكمال المشاركة
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Video shared successfully!')),
      );
    } catch (e) {
      // إظهار إشعار في حالة وجود خطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Desktop Video Share'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            downloadAndShareVideo('https://example.com/video.mp4');
          },
          child: Text('Download and Share Video'),
        ),
      ),
    );
  }
}
