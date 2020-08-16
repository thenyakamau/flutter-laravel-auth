import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SubSubCategories extends Equatable {
  final int id;
  final String name;
  final int sub_category_id;
  final String brands;

  SubSubCategories({
    @required this.id,
    @required this.name,
    @required this.sub_category_id,
    @required this.brands,
  });

  @override
  List<Object> get props => [id, name, sub_category_id, brands];
}
