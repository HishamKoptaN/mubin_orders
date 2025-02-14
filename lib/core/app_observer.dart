import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("🚀 Bloc Transition: $transition");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print("🎯 Bloc Event: $event");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("🔄 Bloc State Change: $change");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print("❌ Bloc Error: $error");

    // تسجيل الخطأ في Firebase Crashlytics
    FirebaseCrashlytics.instance
        .recordError(error, stackTrace, reason: 'Bloc Error');
  }
}
