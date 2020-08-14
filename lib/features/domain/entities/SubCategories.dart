import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SubCategories extends Equatable {
  final int id;
  final String name;
  final String category_id;

  SubCategories({
    @required this.id,
    @required this.name,
    @required this.category_id,
  });
  @override
  List<Object> get props => [id, name, category_id];
}
