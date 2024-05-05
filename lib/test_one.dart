import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'helpers/custom_snackbar.dart';

class CachedVideosList extends StatefulWidget {
  @override
  _CachedVideosListState createState() => _CachedVideosListState();
}

class _CachedVideosListState extends State<CachedVideosList> {
  var pathReference;

  Future<void> download() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      pathReference = storageRef.child("somal_orders/2/video.mp4");

      CustomSnackBar.showCustomErrorSnackBar(
        title: '   نجح ',
        message: ' التنزيل',
      );
    } catch (e) {
      print('Error occurred while downloading file: $e');
    }
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${pathReference.name}');
      await pathReference.writeToFile(file);

      await Share.shareFiles(
        [file.path],
      );
      CustomSnackBar.showCustomErrorSnackBar(
        title: '   نجح ',
        message: ' المشاركه',
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: '   فشل ',
        message: ' المشاركه',
      );
    }
  }

  Future<void> downloadFileWithProgress() async {
    try {} catch (e) {
      print('Error occurred while downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached Videos'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await download();
              },
              child: const Text('Download'),
            )
          ],
        ),
      ),
    );
  }
}
