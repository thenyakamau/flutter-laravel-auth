part of 'addproduct_bloc.dart';

abstract class AddproductEvent extends Equatable {
  const AddproductEvent();
}

class GetDisplayColorsEvent extends AddproductEvent {
  @override
  List<Object> get props => [];
}

class GetDisplayCategoriesEvent extends AddproductEvent {
  @override
  List<Object> get props => [];
}

class GetDisplaySubCategoriesEvent extends AddproductEvent {
  final Categories category;

  GetDisplaySubCategoriesEvent({@required this.category});
  @override
  List<Object> get props => [category];
}

class GetDisplaySubSubCategoriesEvent extends AddproductEvent {
  final SubCategories subCategories;

  GetDisplaySubSubCategoriesEvent({@required this.subCategories});
  @override
  List<Object> get props => [subCategories];
}

class GetDisplayBrandsEvent extends AddproductEvent {
  final SubSubCategories subSubCategories;

  GetDisplayBrandsEvent({@required this.subSubCategories});
  @override
  List<Object> get props => [subSubCategories];
}
