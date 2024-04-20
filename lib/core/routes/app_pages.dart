import 'package:flutter/material.dart';
import 'package:to_do_app/auth/presentation/screens/signin_screen.dart';
import 'package:to_do_app/auth/presentation/screens/signup_screen.dart';
import 'package:to_do_app/auth/presentation/screens/splash_screen.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/home/presentation/screen/home_screen.dart';
import 'package:to_do_app/home/presentation/screen/detail_todo_screen.dart';
import 'package:to_do_app/home/presentation/screen/profile_screen.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.signIn: (context) => const SignInScreen(),
    Routes.signUp: (context) => const SignUpScreen(),
    Routes.home: (context) => const HomeScreen(),
    Routes.detailToDo: (context) =>
        DetailToDoScreen(ModalRoute.of(context)!.settings.arguments! as int),
    Routes.profile: (context) => const ProfileScreen(),
  };
}
