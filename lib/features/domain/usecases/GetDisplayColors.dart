import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/CustomColors.dart';
import '../repositories/AddProductsRepository.dart';

@lazySingleton
class GetDisplayColors extends UseCase<List<CustomColors>, NoParams> {
  final AddProductsRepository productsRepository;

  GetDisplayColors({@required this.productsRepository});

  @override
  Future<Either<Failure, List<CustomColors>>> call(NoParams params) {
    return productsRepository.getCustomColors();
  }
}
