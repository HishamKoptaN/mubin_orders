import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../add_order/views/add_order_view.dart';
import '../../../auth/login/present/view/login_view.dart';
import '../../../home/home_view.dart';
import '../../../orders/present/views/orders_view.dart';
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
    return BlocProvider(
      create: (context) => MainBloc(
        auth: getIt(),
      )..add(
          const MainEvent.check(),
        ),
      child: Scaffold(
        body: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return state.maybeWhen(
              logedIn: () =>  HomeView(),
              logedOut: () => const LoginView(),
              orElse: () => const CustomCircularProgress(),
            );
          },
        ),
      ),
    );
  }
}


