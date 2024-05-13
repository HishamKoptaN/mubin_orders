import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

void main() {
  runApp(MyAppGallery());
}

class MyAppGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoGalleryProvider(),
      child: MaterialApp(
        title: 'Video Gallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: VideoGalleryPage(),
      ),
    );
  }
}

class VideoGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Gallery'),
      ),
      body: Consumer<VideoGalleryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.hasError) {
            return Center(child: Text('Error: ${provider.errorMessage}'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: provider.videoUrls.length,
              itemBuilder: (context, index) {
                final videoUrl = provider.videoUrls[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to video player page
                    // You can implement this part as needed
                  },
                  child: Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.video_collection),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class VideoGalleryProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';
  List<String> _videoUrls = [];

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  List<String> get videoUrls => _videoUrls;

  VideoGalleryProvider() {
    fetchVideoUrls();
  }

  Future<void> fetchVideoUrls() async {
    try {
      _isLoading = true;
      final ListResult result =
          await firebase_storage.FirebaseStorage.instance.ref().listAll();
      _videoUrls = result.items.map((e) => e.fullPath).toList();
    } catch (error) {
      _hasError = true;
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
