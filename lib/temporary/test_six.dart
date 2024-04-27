// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:share_plus/share_plus.dart';

// class MyAppSix extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Recorder & Share',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: VideoRecorderPage(),
//     );
//   }
// }

// class VideoRecorderPage extends StatefulWidget {
//   @override
//   _VideoRecorderPageState createState() => _VideoRecorderPageState();
// }

// class _VideoRecorderPageState extends State<VideoRecorderPage> {
//   late File? _videoFile;

//   Future<void> _recordVideo() async {
//     final pickedFile =
//         await ImagePicker().pickVideo(source: ImageSource.camera);
//     if (pickedFile != null) {
//       setState(
//         () {
//           _videoFile = File(pickedFile.path);
//         },
//       );
//     }
//   }

//   Future<void> _shareVideo() async {
//     String defaultVideoPath = 'REC3030890499553420897';
//     _videoFile = File(defaultVideoPath);

//     if (_videoFile != null && _videoFile!.existsSync()) {
//       await Share.shareFiles([_videoFile!.path], text: 'Check out this video!');
//     } else {
//       print('Video file does not exist!');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Recorder & Share'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _recordVideo,
//               child: Text('Record Video'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _shareVideo,
//               child: Text('Share Video'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
