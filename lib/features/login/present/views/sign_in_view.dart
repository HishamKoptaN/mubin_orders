import '../../../../core/all_imports.dart';
import '../../../main/present/view/adaptive_layout_widget.dart';
import 'login_view.dart';

class SigninView extends StatelessWidget {
  const SigninView({
    super.key,
  });
  static const String routeName = "signin";
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AdaptiveLayout(
        mobileLayout: (context) => const LoginView(),
        tabletLayout: (context) => const LoginView(),
        desktopLayout: (context) => const LoginView(),
      ),
    );
  }
}
