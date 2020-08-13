import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../entities/CustomColors.dart';

abstract class AddProductsRepository {
  Future<Either<Failure, CustomColors>> getCustomColors();
}
