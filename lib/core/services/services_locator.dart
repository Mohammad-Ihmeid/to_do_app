import 'package:get_it/get_it.dart';
import 'package:to_do_app/auth/data/repository/auth_repository.dart';
import 'package:to_do_app/auth/domain/repository/base_auth_repository.dart';
import 'package:to_do_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:to_do_app/auth/presentation/controller/bloc_auth/auth_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  init() {
    //Bloc
    getIt.registerFactory(() => AuthBloc(getIt()));

    //Use Case
    getIt.registerLazySingleton(() => SignUpUseCase(getIt()));

    //Repository
    getIt.registerLazySingleton<BaseAuthRepository>(() => AuthRepository());
  }
}
