abstract class Routes {
  Routes._();

  static const splash = Paths.splash;
  static const signIn = Paths.signIn;
  static const signUp = Paths.signUp;
  static const home = Paths.home;
  static const detailToDo = Paths.detailToDo;
  static const profile = Paths.profile;
}

abstract class Paths {
  static const splash = '/splash';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const home = '/home';
  static const detailToDo = '/detailToDo';
  static const profile = '/profile';
}
