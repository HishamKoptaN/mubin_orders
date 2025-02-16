import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseAuth auth;

  HomeBloc({
    required this.auth,
  }) : super(
          const HomeState.initial(),
        ) {
    on<HomeEvent>(
      (event, emit) async {
       
      },
    );
  }
}
