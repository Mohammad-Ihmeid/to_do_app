abstract class Routes {
  Routes._();

  static const signIn = Paths.signIn;
  static const signUp = Paths.signUp;
  static const home = Paths.home;
  static const detailToDo = Paths.detailToDo;
}

abstract class Paths {
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const home = '/home';
  static const detailToDo = '/detailToDo';
}
