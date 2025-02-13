import '../../../../../all_imports.dart';
import '../../../../main/present/view/adaptive_layout_widget.dart';
import '../../view/login_view.dart';
import '../bloc/login_bloc.dart';

class SigninView extends StatelessWidget {
  const SigninView({
    super.key,
  });
  static const String routeName = "signin";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginUseCase: getIt(),
        firebaseAuth: getIt(),
        firebaseLoginUseCase: getIt(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AdaptiveLayout(
          mobileLayout: (context) => const LoginView(),
          tabletLayout: (context) => const LoginView(),
          desktopLayout: (context) => const LoginView(),
        ),
      ),
    );
  }
}
