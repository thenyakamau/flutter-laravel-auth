import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../../domain/entities/CustomColors.dart';
import '../../domain/repositories/AddProductsRepository.dart';

class AddProductsRepositoryImpl implements AddProductsRepository {
  @override
  Future<Either<Failure, CustomColors>> getCustomColors() {}
}
