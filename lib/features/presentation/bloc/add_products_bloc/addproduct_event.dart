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
  final int id;

  GetDisplaySubCategoriesEvent({@required this.id});
  @override
  List<Object> get props => [id];
}
