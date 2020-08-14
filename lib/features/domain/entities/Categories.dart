import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Categories extends Equatable {
  final int id;
  final String name;
  final String banner;
  final String icon;
  final String feature;
  final String top;

  Categories({
    @required this.id,
    @required this.name,
    @required this.banner,
    @required this.icon,
    @required this.feature,
    @required this.top,
  });

  @override
  List<Object> get props => [id, name, banner, icon, feature, top];
}
