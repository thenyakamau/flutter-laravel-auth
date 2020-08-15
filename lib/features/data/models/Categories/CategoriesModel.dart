import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/Categories.dart';

part 'CategoriesModel.g.dart';

@JsonSerializable()
class CategoriesModel extends Categories {
  final int id;
  final String name;
  final String icon;
  final String feature;
  final String top;
  final String created_at;
  final String updated_at;

  CategoriesModel({
    @required this.id,
    @required this.name,
    @required this.icon,
    @required this.feature,
    @required this.top,
    this.created_at,
    this.updated_at,
  }) : super(
          id: id,
          name: name,
          icon: icon,
          feature: feature,
          top: top,
        );
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
