import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FileUploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileUploadBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('File Upload with Bloc'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<FileUploadBloc, FileUploadState>(
                builder: (context, state) {
                  if (state is FileUploadInitial) {
                    return const Text('Pick a file to upload');
                  } else if (state is FileUploadInProgress) {
                    return Column(
                      children: [
                        LinearProgressIndicator(value: state.progress),
                        const SizedBox(height: 20),
                        Text(
                          '${(state.progress * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    );
                  } else if (state is FileUploadSuccess) {
                    return Text('Upload successful: ${state.filePath}');
                  } else if (state is FileUploadFailure) {
                    return Text('Upload failed: ${state.error}');
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<FileUploadBloc>().add(PickFileEvent());
                },
                child: const Text('Pick File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class FileUploadEvent {}

class PickFileEvent extends FileUploadEvent {}

class UploadFileEvent extends FileUploadEvent {
  final XFile file;
  UploadFileEvent(this.file);
}

abstract class FileUploadState {}

class FileUploadInitial extends FileUploadState {}

class FileUploadInProgress extends FileUploadState {
  final double progress;
  FileUploadInProgress(this.progress);
}

class FileUploadSuccess extends FileUploadState {
  final String filePath;
  FileUploadSuccess(this.filePath);
}

class FileUploadFailure extends FileUploadState {
  final String error;
  FileUploadFailure(this.error);
}

class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  FileUploadBloc() : super(FileUploadInitial()) {
    on<PickFileEvent>(_onPickFileEvent);
    on<UploadFileEvent>(_onUploadFileEvent);
  }

  Future<void> _onPickFileEvent(
      PickFileEvent event, Emitter<FileUploadState> emit) async {
    final picker = ImagePicker();
    final file = await picker.pickVideo(source: ImageSource.gallery);
    if (file != null) {
      add(UploadFileEvent(file));
    }
  }

  Future<void> _onUploadFileEvent(
      UploadFileEvent event, Emitter<FileUploadState> emit) async {
    final uri = Uri.parse(
      'https://mubin.aquan.website/api/upload-file',
    );
    final request = http.MultipartRequest('POST', uri);
    request.files
        .add(await http.MultipartFile.fromPath('file', event.file.path));
    try {
      final streamedResponse = await request.send();
      double progress = 0.0;
      final totalBytes = streamedResponse.contentLength ?? 1;

      await for (var value in streamedResponse.stream) {
        progress += value.length / totalBytes;
        emit(
          FileUploadInProgress(
            progress.clamp(0.0, 1.0),
          ),
        ); // لتجنب تجاوز الـ 100%
      }

      final response = await http.Response.fromStream(streamedResponse);
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        emit(FileUploadSuccess(responseData['file_path']));
      } else {
        emit(FileUploadFailure('Upload failed'));
      }
    } catch (e) {
      emit(FileUploadFailure(e.toString()));
    }
  }
}
