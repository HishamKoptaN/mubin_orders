import 'package:flutter/material.dart';
import 'package:shimmer_effect/shimmer_effect.dart';

class ShimmerTest extends StatelessWidget {
  const ShimmerTest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shimmer Animation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ShimmerEffect(
          baseColor: Colors.teal,
          highlightColor: Colors.blueAccent,
          child: const SizedBox(
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  size: 72,
                  color: Colors.red,
                ),
                SizedBox(height: 16),
                Text(
                  'Shimmer Animation',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
