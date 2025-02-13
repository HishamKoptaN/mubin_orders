import '../../../../all_imports.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../auth/login/view/login_view.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_event.dart';
import '../bloc/main_state.dart';
import 'adaptive_layout_widget.dart';
import 'desktob_layout.dart';
import 'mobile_layout.dart';
import 'tablet_layout.dart';

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
              logedIn: () => AdaptiveLayout(
                mobileLayout: (context) => const MobileLayout(),
                tabletLayout: (context) => const TabletLayout(),
                desktopLayout: (context) => const DesktobLayout(),
              ),
              logedOut: () => const LoginView(),
              orElse: () => const CustomCircularProgress(),
            );
          },
        ),
      ),
    );
  }
}
