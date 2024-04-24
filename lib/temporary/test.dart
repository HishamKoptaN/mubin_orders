import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MyAppAppinio extends StatefulWidget {
  const MyAppAppinio({Key? key}) : super(key: key);

  @override
  State<MyAppAppinio> createState() => _MyAppAppinioState();
}

class _MyAppAppinioState extends State<MyAppAppinio> {
  AppinioSocialShare appinioSocialShare = AppinioSocialShare();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Share Feature",
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("ShareToWhatsapp"),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform
                    .pickFiles(type: FileType.image, allowMultiple: false);
                if (result != null && result.paths.isNotEmpty) {
                  shareToWhatsApp("message", result.paths[0]!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  shareToWhatsApp(String message, String filePath) async {
    await appinioSocialShare.android.shareToSMS(message, filePath);
  }
}
