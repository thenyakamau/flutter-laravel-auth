import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/SubSubCategories.dart';
import '../repositories/AddProductsRepository.dart';

@lazySingleton
class GetSubSubCategories extends UseCase<List<SubSubCategories>, ParamsId> {
  final AddProductsRepository productsRepository;

  GetSubSubCategories({@required this.productsRepository});

  @override
  Future<Either<Failure, List<SubSubCategories>>> call(ParamsId params) {
    return productsRepository.getSubSubCategories(params.id);
  }
}
