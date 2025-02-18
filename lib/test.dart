import 'dart:developer';
import 'dart:io';
// import 'package:example/src/api_model.dart';
// import 'package:example/theme.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tbib_file_uploader/tbib_file_uploader.dart';

class TbibFileUploaderView extends StatefulWidget {
  final String title;

  const TbibFileUploaderView({super.key, required this.title});

  @override
  State<TbibFileUploaderView> createState() => _TbibFileUploaderViewState();
}

class _TbibFileUploaderViewState extends State<TbibFileUploaderView> {
  bool hide = false;
  File? selectedFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String enterValue = '';
  double _progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: Colors.grey[200],
                        color: Colors.blueAccent,
                      ),
                      Builder(builder: (context) {
                        bool isHide = false;
                        return StatefulBuilder(
                          builder: (_, builderSetState) => Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text('Show or hide widget'),
                                  Switch.adaptive(
                                      value: !isHide,
                                      onChanged: (v) {
                                        builderSetState(() {
                                          isHide = !isHide;
                                        });
                                      }),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent,
                                        width: isHide ? 0 : 1),
                                    borderRadius: BorderRadius.circular(30)),
                                child: TBIBUploaderFile(
                                  showFileName: true,
                                  isSelectedFile: true,
                                  isHide: isHide,
                                  enableSelectFile: (_) {
                                    if (enterValue.isEmpty) {
                                      return 'please enter value in text field first';
                                    }
                                    return null;
                                  },
                                  validator: (p0) {
                                    if (selectedFile == null) {
                                      return 'Please select file';
                                    }
                                    return null;
                                  },
                                  selectMultiImage: false,
                                  allowedExtensions: const [
                                    // FileExtensions.DOCX,
                                    FileExtensions.PDF,
                                    FileExtensions.JPG,
                                    FileExtensions.PNG
                                  ],
                                  fileType: FileType.image,
                                  displayNote: '',
                                  selectImageGallery: true,
                                  selectImageCamera: true,
                                  selectedFile: ({name, path}) {
                                    if (path == null) return;
                                    log('selectedFile $name $path');
                                    selectedFile = File(path[0]!);
                                  },
                                  children: [
                                    TextFormField(
                                      onChanged: (v) {
                                        enterValue = v;
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    builderSetState(() {
                                      isHide = !isHide;
                                    });
                                  },
                                  child: const Text('Hide')),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () async {
                          // if (_formKey.currentState!.validate()) {
                          // if (selectedFile == null) return;
                          setState(() {
                            _progress = 0.0; // إعادة تعيين التقدم عند البدء
                          });

                          Response<Map<String, dynamic>>? dataApi =
                              await TBIBFileUploader()
                                  .startUploadFileWithResponse(
                            dio: Dio(
                              BaseOptions(
                                baseUrl: 'https://m-api.aquan.website/api/',
                              ),
                            ),
                            pathApi: 'orders',
                            showNotification: selectedFile != null &&
                                await Permission.notification.isGranted,
                            method: 'POST',
                            yourData: FormData.fromMap(
                              {
                                'file': MultipartFile.fromFileSync(
                                  selectedFile!.path,
                                  filename: selectedFile!.path
                                      .split(Platform.pathSeparator)
                                      .last,
                                ),
                              },
                            ),
                            onSendProgress: (
                                {required int countDownloaded,
                                required int totalSize}) {
                              if (totalSize > 0) {
                                setState(() {
                                  _progress = countDownloaded /
                                      totalSize; // Calculate progress
                                });
                              }
                            },
                          );
                          // var res = ApiModel.fromMap(dataApi!.data!);
                          // log(res.toJson());
                          // }
                        },
                        child: const Text('Submit')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectFileOrImage(
          context: context,
          selectedFile: ({String? name, String? path}) {
            log('selectedFile: $name , $path');
          },
          selectFile: false,
          selectImageCamera: true,
          selectImageGallery: true);
    });
  }
}
