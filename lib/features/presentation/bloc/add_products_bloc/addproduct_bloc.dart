import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/usecases/UseCases.dart';
import '../../../../core/utils/Constants.dart';
import '../../../domain/entities/Categories.dart';
import '../../../domain/entities/CustomColors.dart';
import '../../../domain/entities/SubCategories.dart';
import '../../../domain/usecases/GetCategories.dart';
import '../../../domain/usecases/GetDisplayColors.dart';
import '../../../domain/usecases/GetSubCategories.dart';

part 'addproduct_event.dart';
part 'addproduct_state.dart';

class AddproductBloc extends Bloc<AddproductEvent, AddproductState> {
  final GetDisplayColors displayColors;
  final GetCategories getCategories;
  final GetSubCategories getSubCategories;

  AddproductBloc({
    @required this.displayColors,
    @required this.getCategories,
    @required this.getSubCategories,
  }) : super(AddproductInitial());

  @override
  Stream<AddproductState> mapEventToState(
    AddproductEvent event,
  ) async* {
    if (event is GetDisplayColorsEvent) {
      yield AddProductLoadingState();
      final colorsEither = await displayColors(NoParams());
      yield* colorsEither.fold((failure) async* {
        yield AddProductsErrorState(message: _mapFailureToMessage(failure));
      }, (colors) async* {
        yield AddProductChooseColorState(customColors: colors);
      });
    } else if (event is GetDisplayCategoriesEvent) {
      yield AddProductLoadingState();
      final categoriesEither = await getCategories(NoParams());
      yield* categoriesEither.fold((failure) async* {
        yield AddProductsErrorState(message: _mapFailureToMessage(failure));
      }, (categories) async* {
        yield AddProductChooseCategoryState(categories: categories);
      });
    } else if (event is GetDisplaySubCategoriesEvent) {
      yield AddProductLoadingState();
      final subCategoriesEither =
          await getSubCategories(ParamsId(id: event.category.id));
      yield* subCategoriesEither.fold((failure) async* {
        yield AddProductsErrorState(message: _mapFailureToMessage(failure));
      }, (subCategories) async* {
        yield AddProductChooseSubCategoryState(subCategories: subCategories);
      });
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
