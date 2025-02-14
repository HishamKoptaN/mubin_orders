import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final FirebaseAuth auth;

  MainBloc({
    required this.auth,
  }) : super(
          const MainState.initial(),
        ) {
    on<MainEvent>(
      (event, emit) async {
        await event.when(
          check: () async {
            emit(
              const MainState.loading(),
            );
            User? user = FirebaseAuth.instance.currentUser;
            String? idToken = await user?.getIdToken();
            if (idToken == null
                // && idToken!.isEmpty
                ) {
              emit(
                const MainState.logedIn(),
              );
            } else {
              emit(
                const MainState.logedOut(),
              );
            }
          },
        );
      },
    );
  }
}
