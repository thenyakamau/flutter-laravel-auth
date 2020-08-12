import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/NetworkInfo.dart';
import 'core/utils/AuthentcationCheck.dart';
import 'database/EcommerceDatabase.dart';
import 'features/data/datasources/Home/HomeLocalDataSource.dart';
import 'features/data/datasources/Home/HomeRemoteDataSource.dart';
import 'features/data/datasources/api/AppApiService.dart';
import 'features/data/datasources/auth/AuthLocalDataSource.dart';
import 'features/data/datasources/auth/AuthRemoteDataSource.dart';
import 'features/data/repositories/AuthRepositoryImpl.dart';
import 'features/data/repositories/HomeRepositoryImpl.dart';
import 'features/domain/repositories/AuthRepository.dart';
import 'features/domain/repositories/HomeRepository.dart';
import 'features/domain/usecases/DashBoardDetails.dart';
import 'features/domain/usecases/LoginUser.dart';
import 'features/domain/usecases/RefreshAuthentication.dart';
import 'features/domain/usecases/RegisterUser.dart';
import 'features/domain/usecases/SplashRefresh.dart';
import 'features/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/presentation/bloc/home_bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initializeAuth();
  _initializeAuthRepository();
  _initializeHome();
  _initializeHomeRepository();
  _initializeDatabase();

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
      businessSettingsDao: sl(),
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
      splashRefresh: sl(),
    ),
  );
  sl.registerLazySingleton(() => CheckAuthentication());
  sl.registerLazySingleton(() => LoginUser(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUser(authRepository: sl()));
  sl.registerLazySingleton(() => RefreshAuthentication(authRepository: sl()));
  sl.registerLazySingleton(() => SplashRefresh(authRepository: sl()));
}

void _initializeHomeRepository() {
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      authLocalDataSource: sl(),
      networkInfo: sl(),
      homeRemoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      apiService: sl(),
    ),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
}

void _initializeHome() {
  sl.registerFactory(() => HomeBloc(dashBoardDetails: sl()));
  sl.registerLazySingleton(() => DashBoardDetails(homeRepository: sl()));
}

void _initializeDatabase() {
  sl.registerLazySingleton(() => EcommerceDatabase().businessSettingsDao);
}
