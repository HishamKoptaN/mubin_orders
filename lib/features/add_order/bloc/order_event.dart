import 'package:image_picker/image_picker.dart';

abstract class ProductEvent {}

class SelectFilesEvent extends ProductEvent {
  final int file;
  SelectFilesEvent(this.file);
}

class SubmitOrderEvent extends ProductEvent {}

class AddOrderEvent extends ProductEvent {
  final String clientId;
  final String place;
  final XFile video;
  final XFile imageOne;
  final XFile imageTwo;

  AddOrderEvent({
    required this.clientId,
    required this.place,
    required this.video,
    required this.imageOne,
    required this.imageTwo,
  });
}
