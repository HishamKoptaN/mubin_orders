import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/main_use_casees.dart';
import 'main_event.dart';
import 'main_state.dart';
import 'package:injectable/injectable.dart' show Injectable;

@Injectable()

class MainBloc extends Bloc<MainEvent, MainState> {
  final FirebaseAuth auth;
  MainUseCasess mainUseCasess;
  MainBloc({
    required this.auth,
    required this.mainUseCasess,
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
            if (isUserLoggedIn()) {
              try {
                final res = await mainUseCasess.check();
                await res!.when(
                  success: (res) async {
                    emit(
                      const MainState.logedIn(),
                    );
                  },
                  failure: (apiErrorModel) async {
                    emit(
                      const MainState.logedOut(),
                    );
                  },
                );
              } catch (e) {
                emit(
                  const MainState.logedOut(),
                );
              }
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
  bool isUserLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
