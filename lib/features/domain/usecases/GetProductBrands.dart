import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/Brands.dart';
import '../repositories/AddProductsRepository.dart';

@lazySingleton
class GetProductBrands extends UseCase<List<Brands>, ProductBrandsParams> {
  final AddProductsRepository productsRepository;

  GetProductBrands({@required this.productsRepository});
  @override
  Future<Either<Failure, List<Brands>>> call(ProductBrandsParams params) {
    return productsRepository.getProductBrands(params.brand_ids);
  }
}

class ProductBrandsParams extends Equatable {
  final String brand_ids;

  ProductBrandsParams({@required this.brand_ids});
  @override
  List<Object> get props => [brand_ids];
}
