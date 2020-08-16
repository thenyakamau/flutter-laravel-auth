import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/SubCategories.dart';
import '../repositories/AddProductsRepository.dart';

@lazySingleton
class GetSubCategories extends UseCase<List<SubCategories>, ParamsId> {
  final AddProductsRepository productsRepository;

  GetSubCategories({@required this.productsRepository});

  @override
  Future<Either<Failure, List<SubCategories>>> call(ParamsId params) {
    return productsRepository.getSubCategories(params.id);
  }
}
