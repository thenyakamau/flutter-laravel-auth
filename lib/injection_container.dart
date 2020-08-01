import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/NetworkInfo.dart';
import 'core/utils/AuthentcationCheck.dart';
import 'features/data/datasources/AppApiService.dart';
import 'features/data/datasources/AuthLocalDataSource.dart';
import 'features/data/datasources/AuthRemoteDataSource.dart';
import 'features/data/repositories/AuthRepositoryImpl.dart';
import 'features/domain/repositories/AuthRepository.dart';
import 'features/domain/usecases/LoginUser.dart';
import 'features/domain/usecases/RefreshAuthentication.dart';
import 'features/domain/usecases/RegisterUser.dart';
import 'features/presentation/bloc/auth_bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initializeAuth();
  _initializeAuthRepository();

  //!core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => AppApiService.create());

  //!External
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => DataConnectionChecker());
}

void _initializeAuthRepository() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      apiService: sl(),
    ),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
}

void _initializeAuth() {
  sl.registerFactory(
    () => AuthBloc(
      checkAuthentication: sl(),
      loginUser: sl(),
      registerUser: sl(),
      refreshAuthentication: sl(),
    ),
  );
  sl.registerLazySingleton(() => CheckAuthentication());
  sl.registerLazySingleton(() => LoginUser(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUser(authRepository: sl()));
  sl.registerLazySingleton(() => RefreshAuthentication(authRepository: sl()));
}
