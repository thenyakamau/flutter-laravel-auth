import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/Categories.dart';
import '../repositories/AddProductsRepository.dart';

class GetCategories extends UseCase<List<Categories>, NoParams> {
  final AddProductsRepository productsRepository;

  GetCategories({@required this.productsRepository});
  @override
  Future<Either<Failure, List<Categories>>> call(NoParams params) {
    return productsRepository.getCategories();
  }
}
