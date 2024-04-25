// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class MyAppTest extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyAppTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Plus"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Share eclectify University with your friends:',
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                shareIt(
                    '/data/user/0/com.example.docs_orders/cache/REC3030890499553420897.mp4');
              },
              child: Icon(
                Icons.share,
                color: Colors.redAccent,
              ),
            ),

            // IconButton(
            //     onPressed: sharePressed,
            //     icon: Icon(
            //       Icons.share,
            //       color: Colors.redAccent,
            //     )),
            Image.asset(
              "assets/lunch_break.png",
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> shareIt(String filename) async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      filename = ''; // تعيين اسم الملف
      File file = File('$tempPath/$filename.mp4');
      await file.create(); // انتظار إنشاء الملف
      if (file.existsSync()) {
        await Share.shareFiles([file.path], text: 'Shared video');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
