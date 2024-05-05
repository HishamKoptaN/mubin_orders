import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../model/firebase_file.dart';

class FirebaseApi {
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map(
          (index, url) {
            final ref = result.items[index];
            final name = ref.name;
            final file = FirebaseFile(ref: ref, name: name, url: url);
            return MapEntry(index, file);
          },
        )
        .values
        .toList();
  }

  static Future downloadFile(
      Reference videoRef, Reference imageOneRef, Reference imageTwoRef) async {
    final dir = await getApplicationDocumentsDirectory();
    final videoFile = File('${dir.path}/${videoRef.name}.mp4');
    final imageOneFile = File('${dir.path}/${videoRef.name}.jpeg');
    final imageTwoFile = File('${dir.path}/${videoRef.name}.jpeg');
    await videoRef.writeToFile(videoFile);
    await imageOneRef.writeToFile(imageOneFile);
    await imageTwoRef.writeToFile(imageTwoFile);

    await Share.shareFiles(
      [videoFile.path, imageOneFile.path, imageTwoFile.path],
    );
  }
}
