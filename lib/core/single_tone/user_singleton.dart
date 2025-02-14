import '../models/user_data.dart';

class UserDataSingleton {
  UserData? _user;
  static final UserDataSingleton _instance = UserDataSingleton._internal();
  UserDataSingleton._internal();
  static UserDataSingleton get instance => _instance;
  UserData? get user => _user;
  set user(UserData? user) {
    _user = user;
  }

  void clearUserData() {
    _user = null;
  }
}
