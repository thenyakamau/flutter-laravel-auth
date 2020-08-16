// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/data/datasources/AddProducts/AddProductLocalDataSource.dart';
import 'features/data/datasources/AddProducts/AddProductsRemoteDataSource.dart';
import 'features/domain/repositories/AddProductsRepository.dart';
import 'features/data/repositories/AddProductsRepositoryImpl.dart';
import 'features/presentation/bloc/add_products_bloc/addproduct_bloc.dart';
import 'features/data/datasources/api/AppApiService.dart';
import 'features/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/data/datasources/auth/AuthLocalDataSource.dart';
import 'features/data/datasources/auth/AuthRemoteDataSource.dart';
import 'features/domain/repositories/AuthRepository.dart';
import 'features/data/repositories/AuthRepositoryImpl.dart';
import 'database/BusinessSettingsData/BusinessSettingsDao.dart';
import 'database/CategoryData/CategoriesDao.dart';
import 'core/utils/AuthentcationCheck.dart';
import 'database/CustomColorsData/CustomColorsDao.dart';
import 'features/domain/usecases/DashBoardDetails.dart';
import 'features/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'database/EcommerceDatabase.dart';
import 'features/domain/usecases/GetCategories.dart';
import 'features/domain/usecases/GetDisplayColors.dart';
import 'features/domain/usecases/GetSubCategories.dart';
import 'features/presentation/bloc/home_bloc/home_bloc.dart';
import 'features/data/datasources/Home/HomeLocalDataSource.dart';
import 'features/data/datasources/Home/HomeRemoteDataSource.dart';
import 'features/domain/repositories/HomeRepository.dart';
import 'features/data/repositories/HomeRepositoryImpl.dart';
import 'inject_modules.dart';
import 'features/domain/usecases/LoginUser.dart';
import 'core/network/NetworkInfo.dart';
import 'features/domain/usecases/RefreshAuthentication.dart';
import 'features/domain/usecases/RegisterUser.dart';
import 'features/domain/usecases/SplashRefresh.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final injectionModules = _$InjectionModules();
  gh.lazySingleton<AppApiService>(() => AppApiService.create());
  gh.lazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiService: get<AppApiService>()));
  gh.lazySingleton<CheckAuthentication>(() => CheckAuthentication());
  gh.lazySingleton<DataConnectionChecker>(
      () => injectionModules.dataConnectionChecker);
  gh.factory<EcommerceDatabase>(() => EcommerceDatabase());
  gh.lazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiService: get<AppApiService>()));
  gh.lazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(get<DataConnectionChecker>()));
  final sharedPreferences = await injectionModules.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<AddProductRemoteDataSource>(
      () => AddProductRemoteDataSourceImpl(apiService: get<AppApiService>()));
  gh.lazySingleton<BusinessSettingsDao>(
      () => BusinessSettingsDao(get<EcommerceDatabase>()));
  gh.lazySingleton<CategoriesDao>(
      () => CategoriesDao(get<EcommerceDatabase>()));
  gh.lazySingleton<CustomColorsDao>(
      () => CustomColorsDao(get<EcommerceDatabase>()));
  gh.lazySingleton<HomeLocalDataSource>(() =>
      HomeLocalDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.lazySingleton<AddProductLocalDataSource>(() =>
      AddProductLocalDataSourceImpl(
          colorsDao: get<CustomColorsDao>(),
          categoriesDao: get<CategoriesDao>()));
  gh.lazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(
      sharedPreferences: get<SharedPreferences>(),
      businessSettingsDao: get<BusinessSettingsDao>()));
  gh.lazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: get<AuthRemoteDataSource>(),
        localDataSource: get<AuthLocalDataSource>(),
        networkInfo: get<NetworkInfo>(),
      ));
  gh.lazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        authLocalDataSource: get<AuthLocalDataSource>(),
        networkInfo: get<NetworkInfo>(),
        homeRemoteDataSource: get<HomeRemoteDataSource>(),
        localDataSource: get<HomeLocalDataSource>(),
      ));
  gh.lazySingleton<LoginUser>(
      () => LoginUser(authRepository: get<AuthRepository>()));
  gh.lazySingleton<RefreshAuthentication>(
      () => RefreshAuthentication(authRepository: get<AuthRepository>()));
  gh.lazySingleton<RegisterUser>(
      () => RegisterUser(authRepository: get<AuthRepository>()));
  gh.lazySingleton<SplashRefresh>(
      () => SplashRefresh(authRepository: get<AuthRepository>()));
  gh.lazySingleton<AddProductsRepository>(() => AddProductsRepositoryImpl(
        networkInfo: get<NetworkInfo>(),
        authLocalDataSource: get<AuthLocalDataSource>(),
        productRemoteDataSource: get<AddProductRemoteDataSource>(),
        localDataSource: get<AddProductLocalDataSource>(),
      ));
  gh.factory<AuthBloc>(() => AuthBloc(
        checkAuthentication: get<CheckAuthentication>(),
        loginUser: get<LoginUser>(),
        registerUser: get<RegisterUser>(),
        refreshAuthentication: get<RefreshAuthentication>(),
        splashRefresh: get<SplashRefresh>(),
      ));
  gh.lazySingleton<DashBoardDetails>(
      () => DashBoardDetails(homeRepository: get<HomeRepository>()));
  gh.factory<DashboardBloc>(
      () => DashboardBloc(dashBoardDetails: get<DashBoardDetails>()));
  gh.lazySingleton<GetCategories>(
      () => GetCategories(productsRepository: get<AddProductsRepository>()));
  gh.lazySingleton<GetDisplayColors>(
      () => GetDisplayColors(productsRepository: get<AddProductsRepository>()));
  gh.lazySingleton<GetSubCategories>(
      () => GetSubCategories(productsRepository: get<AddProductsRepository>()));
  gh.factory<HomeBloc>(
      () => HomeBloc(dashBoardDetails: get<DashBoardDetails>()));
  gh.factory<AddproductBloc>(() => AddproductBloc(
        displayColors: get<GetDisplayColors>(),
        getCategories: get<GetCategories>(),
        getSubCategories: get<GetSubCategories>(),
      ));
  return get;
}

class _$InjectionModules extends InjectionModules {}
