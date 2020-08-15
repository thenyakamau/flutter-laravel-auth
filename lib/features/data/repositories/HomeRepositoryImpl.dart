import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/errors/Failures.dart';
import '../../../core/network/NetworkInfo.dart';
import '../../domain/entities/DashBoard.dart';
import '../../domain/repositories/HomeRepository.dart';
import '../datasources/Home/HomeLocalDataSource.dart';
import '../datasources/Home/HomeRemoteDataSource.dart';
import '../datasources/auth/AuthLocalDataSource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({
    @required this.authLocalDataSource,
    @required this.networkInfo,
    @required this.homeRemoteDataSource,
    @required this.localDataSource,
  });
  @override
  Future<Either<Failure, DashBoard>> getDashBoardDetails() async {
    final token = await authLocalDataSource.getAuthToken();
    if (token != null) {
      if (await networkInfo.isConnected) {
        try {
          final dashboard =
              await homeRemoteDataSource.getDashBoardDetails(token);
          localDataSource.cacheDashBoard(dashboard);
          return Right(dashboard);
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        final dashBoardModel = await localDataSource.getDashBoardCache();
        if (dashBoardModel != null) {
          return Right(dashBoardModel);
        } else {
          throw CacheFailure();
        }
      }
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }
}
