part of 'addproduct_bloc.dart';

abstract class AddproductState extends Equatable {
  const AddproductState();
}

class AddproductInitial extends AddproductState {
  @override
  List<Object> get props => [];
}

class AddProductLoadingState extends AddproductState {
  @override
  List<Object> get props => [];
}

class AddProductsErrorState extends AddproductState {
  final String message;

  AddProductsErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}

class AddProductChooseColorState extends AddproductState {
  final List<CustomColors> customColors;

  AddProductChooseColorState({@required this.customColors});
  @override
  List<Object> get props => [customColors];
}

class AddProductChooseCategoryState extends AddproductState {
  final List<Categories> categories;

  AddProductChooseCategoryState({@required this.categories});
  @override
  List<Object> get props => [categories];
}

class AddProductChooseSubCategoryState extends AddproductState {
  final List<SubCategories> subCategories;

  AddProductChooseSubCategoryState({@required this.subCategories});
  @override
  List<Object> get props => [subCategories];
}

class AddProductChooseSubSubCategoryState extends AddproductState {
  final List<SubSubCategories> subSubCategories;

  AddProductChooseSubSubCategoryState({@required this.subSubCategories});

  @override
  List<Object> get props => [subSubCategories];
}

class AddProductChooseBrandState extends AddproductState {
  final List<Brands> brands;

  AddProductChooseBrandState({@required this.brands});

  @override
  List<Object> get props => [brands];
}
