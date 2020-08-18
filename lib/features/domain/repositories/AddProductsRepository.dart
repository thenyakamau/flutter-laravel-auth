import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../entities/Brands.dart';
import '../entities/Categories.dart';
import '../entities/CustomColors.dart';
import '../entities/SubCategories.dart';
import '../entities/SubSubCategories.dart';

abstract class AddProductsRepository {
  Future<Either<Failure, List<CustomColors>>> getCustomColors();
  Future<Either<Failure, List<Categories>>> getCategories();
  Future<Either<Failure, List<SubCategories>>> getSubCategories(int id);
  Future<Either<Failure, List<SubSubCategories>>> getSubSubCategories(int id);
  Future<Either<Failure, List<Brands>>> getProductBrands(String brand_ids);
}
