import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/network/NetworkInfo.dart';
import '../../domain/entities/Categories.dart';
import '../../domain/entities/CustomColors.dart';
import '../../domain/entities/SubCategories.dart';
import '../../domain/entities/SubSubCategories.dart';
import '../../domain/repositories/AddProductsRepository.dart';
import '../datasources/AddProducts/AddProductLocalDataSource.dart';
import '../datasources/AddProducts/AddProductsRemoteDataSource.dart';
import '../datasources/auth/AuthLocalDataSource.dart';

@LazySingleton(as: AddProductsRepository)
class AddProductsRepositoryImpl implements AddProductsRepository {
  final NetworkInfo networkInfo;
  final AuthLocalDataSource authLocalDataSource;
  final AddProductRemoteDataSource productRemoteDataSource;
  final AddProductLocalDataSource localDataSource;

  AddProductsRepositoryImpl({
    @required this.networkInfo,
    @required this.authLocalDataSource,
    @required this.productRemoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<CustomColors>>> getCustomColors() async {
    final customColors = await localDataSource.getCustomColorsCache();
    if (customColors.isEmpty) {
      if (await networkInfo.isConnected) {
        final colorsModel = await productRemoteDataSource.getCustomColors();
        await localDataSource.cacheCustomCOlors(colorsModel);
        return Right(colorsModel);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Right(customColors);
    }
  }

  @override
  Future<Either<Failure, List<Categories>>> getCategories() async {
    final customCategories = await localDataSource.getCategoriesCache();
    if (customCategories.isEmpty) {
      if (await networkInfo.isConnected) {
        final categories = await productRemoteDataSource.getCategories();
        localDataSource.cacheCategories(categories);
        return Right(categories);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Right(customCategories);
    }
  }

  @override
  Future<Either<Failure, List<SubCategories>>> getSubCategories(int id) async {
    if (await networkInfo.isConnected) {
      final subCategories = await productRemoteDataSource.getSubCategories(id);
      return Right(subCategories);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SubSubCategories>>> getSubSubCategories(
      int id) async {
    if (await networkInfo.isConnected) {
      final subSubCategories =
          await productRemoteDataSource.getSubSubCategories(id);
      return Right(subSubCategories);
    } else {
      return Left(ServerFailure());
    }
  }
}
