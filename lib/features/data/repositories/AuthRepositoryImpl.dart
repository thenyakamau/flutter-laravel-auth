import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/errors/Failures.dart';
import '../../../core/network/NetworkInfo.dart';
import '../../domain/entities/ApiSuccess.dart';
import '../../domain/repositories/AuthRepository.dart';
import '../datasources/auth/AuthLocalDataSource.dart';
import '../datasources/auth/AuthRemoteDataSource.dart';
import '../models/ApiSuccess/ApiSuccessModel.dart';
import '../models/AuthToken/AuthTokenModel.dart';
import '../models/BusinessSettings/BusinessSettingsModel.dart';
import '../models/Shop/ShopModel.dart';
import '../models/User/UserModel.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, ApiSuccess>> loginUser(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final authTokenModel =
            await remoteDataSource.loginUser(email, password);
        localDataSource.cacheAuthToken(authTokenModel);
        ApiSuccessModel apiSuccessModel =
            new ApiSuccessModel(success: true, message: "Login success");
        return Right(apiSuccessModel);
      } on ServerException {
        print("server exception");
        return Left(ServerFailure());
      } on UnAuthenticatedException {
        return Left(UnAuthenticatedFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      print("internet exception");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> registerUser(
      UserModel userModel, ShopModel shop) async {
    if (await networkInfo.isConnected) {
      try {
        final authTokenModel =
            await remoteDataSource.registerUser(userModel, shop);
        localDataSource.cacheAuthToken(authTokenModel);
        ApiSuccessModel apiSuccessModel =
            new ApiSuccessModel(success: true, message: "Register success");
        return Right(apiSuccessModel);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> refreshUser() async {
    final authTokenModel = await localDataSource.getAuthToken();
    if (authTokenModel != null) {
      if (await networkInfo.isConnected) {
        try {
          final authTokenObject =
              await remoteDataSource.refreshUser(authTokenModel);
          localDataSource.cacheAuthToken(authTokenObject);
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "Refresh success");
          return Right(apiSuccessModel);
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        } on ServerException {
          return Left(ServerFailure());
        } on CacheException {
          return Left(CacheFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> splashRefresh() async {
    final authTokenModel = await localDataSource.getAuthToken();
    if (authTokenModel != null) {
      if (await networkInfo.isConnected) {
        try {
          final response = await remoteDataSource.splashRefresh(authTokenModel);
          localDataSource.cacheAuthToken(
              AuthTokenModel.fromJson(response.body['refresh_token']));
          List<BusinessSettingsModel> settings =
              (response.body['businessSettings'] as List)
                  .map((e) => BusinessSettingsModel.fromJson(e))
                  .toList();
          localDataSource.cacheBusinessSettings(settings);
          return Right(
              new ApiSuccessModel(success: true, message: "Refresh success"));
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        } on ServerException {
          return Left(ServerFailure());
        } on CacheException {
          return Left(CacheFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }
}
