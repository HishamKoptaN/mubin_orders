import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "role") String? role,
  }) = _UserData;
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
