import 'package:to_do_app/auth/presentation/screens/signin_screen.dart';
import 'package:to_do_app/auth/presentation/screens/signup_screen.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/home/presentation/screen/home_screen.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signIn;

  static final routes = {
    Routes.signIn: (context) => const SignInScreen(),
    Routes.signUp: (context) => const SignUpScreen(),
    Routes.home: (context) => const HomeScreen(),
  };
}
