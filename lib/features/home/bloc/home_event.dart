import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/all_imports.dart';
part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.changeTab({
    required int index,required AppLocalizations t,
  }) = _ChangeTab;
}
