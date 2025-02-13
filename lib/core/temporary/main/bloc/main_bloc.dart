// import 'dart:async';
// import 'package:equatable/equatable.dart';
// import 'package:local_auth/local_auth.dart';
// import '../../../all_imports.dart';
// import '../main_model/main_model.dart';
// import '../main_repo/main_repo.dart';
// part 'main_event.dart';
// part 'main_state.dart';

// class MainBloc extends Bloc<MainEvent, MainState> {
//   MainRepo loginRepo = MainRepo();
//   final LocalAuthentication auth = LocalAuthentication();

//   MainBloc() : super(MainInitial()) {
//     on<CheckLogedIn>(
//       (event, emit) async {
//         emit(MainLoading());
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         String? token = prefs.getString('auth_token');
//         if (token == null) {
//           emit(MainLogedOut());
//         } else {
//           try {
//             Map<String, dynamic> data = await loginRepo.isLogedIn(token);
//             if (data["status"]) {
//               emit(MainLogedIn());
//             } else if (!data["status"]) {
//               emit(MainLogedOut());
//             }
//           } on TimeoutException catch (_) {
//             emit(MainTimeout());
//           } catch (e) {
//             emit(MainLogedOut());
//           }
//         }
//       },
//     );
//   }
// }
