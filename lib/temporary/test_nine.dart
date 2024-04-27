// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MyAppNine extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Send Location on WhatsApp'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               _sendLocationOnWhatsApp();
//             },
//             child: Text('Send Location on WhatsApp'),
//           ),
//         ),
//       ),
//     );
//   }

//   _sendLocationOnWhatsApp() async {
//     // Get current location
//     double latitude = 37.422;
//     double longitude = -122.084;
//     // Prepare WhatsApp message
//     String message =
//         "Check out my location:\nhttps://maps.google.com/?q=$latitude,$longitude";
//     // Encode message
//     String url = "https://wa.me/?text=${Uri.encodeFull(message)}";

//     // Launch WhatsApp
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
