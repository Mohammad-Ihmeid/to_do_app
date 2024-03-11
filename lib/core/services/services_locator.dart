import 'package:get_it/get_it.dart';
import 'package:to_do_app/auth/data/datasource/auth_firebase_source.dart';
import 'package:to_do_app/auth/data/repository/auth_repository.dart';
import 'package:to_do_app/auth/domain/repository/base_auth_repository.dart';
import 'package:to_do_app/auth/domain/usecases/sign_in_usecase.dart';
import 'package:to_do_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:to_do_app/auth/presentation/controller/bloc_auth/auth_bloc.dart';
import 'package:to_do_app/home/data/datasource/home_offline_data_source.dart';
import 'package:to_do_app/home/data/repository/home_repository.dart';
import 'package:to_do_app/home/domain/repository/base_home_repository.dart';
import 'package:to_do_app/home/domain/usecases/add_to_do_usecase.dart';
import 'package:to_do_app/home/domain/usecases/get_to_do_list_usecase.dart';
import 'package:to_do_app/home/presentation/controller/bloc_bottom_sheet/bottom_sheet_bloc.dart';
import 'package:to_do_app/home/presentation/controller/bloc_home/home_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  init() {
    //Bloc
    getIt.registerFactory(() => AuthBloc(getIt(), getIt()));
    getIt.registerFactory(() => BottomSheetBloc(getIt()));
    getIt.registerFactory(() => HomeBloc(getIt()));

    //Use Case
    //Auth
    getIt.registerLazySingleton(() => SignUpUseCase(getIt()));
    getIt.registerLazySingleton(() => SignInUseCase(getIt()));
    //Home
    getIt.registerLazySingleton(() => AddToDoUseCase(getIt()));
    getIt.registerLazySingleton(() => GetToDoListUseCase(getIt()));

    //Repository
    getIt.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(getIt()));
    getIt.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepository(getIt()));

    //Data Source
    getIt.registerLazySingleton<BaseAuthFirebaseSource>(
      () => AuthFirebaseSource(),
    );
    getIt.registerLazySingleton<BaseHomeOfflineDataSource>(
      () => HomeOfflineDataSource(),
    );
  }
}
