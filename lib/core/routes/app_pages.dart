import 'package:to_do_app/auth/signin_screen.dart';
import 'package:to_do_app/core/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signIn;

  static final routes = {
    Routes.signIn: (context) => const SignInScreen(),
  };
}
