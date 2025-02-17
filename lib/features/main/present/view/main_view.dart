import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../auth/login/present/view/login_view.dart';
import '../../../home/home_view.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_event.dart';
import '../bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/di/dependency_injection.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });
  static const String routeName = "MainView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => MainBloc(
            auth: getIt(),
          )..add(
              const MainEvent.check(),
            ),
          child:BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                return state.maybeWhen(
                  logedIn: () => 
                   HomeView(),
                  logedOut: () =>
                   const LoginView(),
                  //  HomeView(),
                  orElse: () => const CustomCircularProgress(),
                );
              },
            ),
        ),
      ),
    );
  }
}


