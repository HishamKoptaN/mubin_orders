import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class ReadDirData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  List<File> _files = [];

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    Directory? externalDir = await getTemporaryDirectory();
    if (externalDir == null) {
      return;
    }
    List<File> files = _getAllFiles(externalDir);
    setState(() {
      _files = files;
    });
  }

  List<File> _getAllFiles(Directory dir) {
    List<File> files = [];
    for (FileSystemEntity entity in dir.listSync()) {
      if (entity is File) {
        files.add(entity);
      } else if (entity is Directory) {
        files.addAll(_getAllFiles(entity));
      }
    }
    return files;
  }

  Future<void> _shareFile(File file) async {
    Share.shareFiles([file.path], text: 'Check out this file!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Files'),
      ),
      body: _files.isEmpty
          ? const Center(
              child: Text('No files found.'),
            )
          : ListView.builder(
              itemCount: _files.length,
              itemBuilder: (context, index) {
                File file = _files[index];
                return ListTile(
                  title: Text(file.path),
                  onTap: () async {
                    await _shareFile(file);
                  },
                );
              },
            ),
    );
  }
}
