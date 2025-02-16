import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/all_imports.dart';
part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.check() = _Check;
}
