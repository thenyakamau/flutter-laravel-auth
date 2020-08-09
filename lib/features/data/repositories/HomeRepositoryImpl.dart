import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/errors/Failures.dart';
import '../../../core/network/NetworkInfo.dart';
import '../../domain/entities/DashBoard.dart';
import '../../domain/repositories/HomeRepository.dart';
import '../datasources/auth/AuthLocalDataSource.dart';
import '../datasources/Home/HomeRemoteDataSource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(
      {@required this.authLocalDataSource,
      @required this.networkInfo,
      @required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, DashBoard>> getDashBoardDetails() async {
    final token = await authLocalDataSource.getAuthToken();
    if (token != null) {
      if (await networkInfo.isConnected) {
        try {
          final dashboard =
              await homeRemoteDataSource.getDashBoardDetails(token);
          return Right(dashboard);
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {}
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }
}
