import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/CustomColors.dart';
import '../repositories/AddProductsRepository.dart';

class GetDisplayColors extends UseCase<CustomColors, NoParams> {
  final AddProductsRepository productsRepository;

  GetDisplayColors({@required this.productsRepository});

  @override
  Future<Either<Failure, CustomColors>> call(NoParams params) {
    return productsRepository.getCustomColors();
  }
}
