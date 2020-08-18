import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/UseCases.dart';
import '../../../../core/utils/MapStateToFailure.dart';
import '../../../domain/entities/Brands.dart';
import '../../../domain/entities/Categories.dart';
import '../../../domain/entities/CustomColors.dart';
import '../../../domain/entities/SubCategories.dart';
import '../../../domain/entities/SubSubCategories.dart';
import '../../../domain/usecases/GetCategories.dart';
import '../../../domain/usecases/GetDisplayColors.dart';
import '../../../domain/usecases/GetProductBrands.dart';
import '../../../domain/usecases/GetSubCategories.dart';
import '../../../domain/usecases/GetSubSubCategories.dart';

part 'addproduct_event.dart';
part 'addproduct_state.dart';

@injectable
class AddproductBloc extends Bloc<AddproductEvent, AddproductState> {
  final GetDisplayColors displayColors;
  final GetCategories getCategories;
  final GetSubCategories getSubCategories;
  final GetSubSubCategories getSubSubCategories;
  final GetProductBrands getProductBrands;

  AddproductBloc({
    @required this.displayColors,
    @required this.getCategories,
    @required this.getSubCategories,
    @required this.getSubSubCategories,
    @required this.getProductBrands,
  }) : super(AddproductInitial());

  @override
  Stream<AddproductState> mapEventToState(
    AddproductEvent event,
  ) async* {
    if (event is GetDisplayColorsEvent) {
      yield AddProductLoadingState();
      final colorsEither = await displayColors(NoParams());
      yield* colorsEither.fold((failure) async* {
        yield AddProductsErrorState(message: mapFailureToMessage(failure));
      }, (colors) async* {
        yield AddProductChooseColorState(customColors: colors);
      });
    } else if (event is GetDisplayCategoriesEvent) {
      yield AddProductLoadingState();
      final categoriesEither = await getCategories(NoParams());
      yield* categoriesEither.fold((failure) async* {
        yield AddProductsErrorState(message: mapFailureToMessage(failure));
      }, (categories) async* {
        yield AddProductChooseCategoryState(categories: categories);
      });
    } else if (event is GetDisplaySubCategoriesEvent) {
      yield AddProductLoadingState();
      final subCategoriesEither =
          await getSubCategories(ParamsId(id: event.category.id));
      yield* subCategoriesEither.fold((failure) async* {
        yield AddProductsErrorState(message: mapFailureToMessage(failure));
      }, (subCategories) async* {
        yield AddProductChooseSubCategoryState(subCategories: subCategories);
      });
    } else if (event is GetDisplaySubSubCategoriesEvent) {
      yield AddProductLoadingState();
      final subSubCategoriesEither = await getSubSubCategories(
        ParamsId(id: event.subCategories.id),
      );
      yield* subSubCategoriesEither.fold((failure) async* {
        yield AddProductsErrorState(message: mapFailureToMessage(failure));
      }, (subSubCategories) async* {
        yield AddProductChooseSubSubCategoryState(
          subSubCategories: subSubCategories,
        );
      });
    } else if (event is GetDisplayBrandsEvent) {
      yield AddProductLoadingState();
      final productBandsEither = await getProductBrands(
        ProductBrandsParams(brand_ids: event.subSubCategories.brands),
      );
      yield* productBandsEither.fold((failure) async* {
        yield AddProductsErrorState(message: mapFailureToMessage(failure));
      }, (brands) async* {
        yield AddProductChooseBrandState(brands: brands);
      });
    }
  }
}
