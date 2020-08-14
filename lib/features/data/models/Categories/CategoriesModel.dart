import 'package:flutter_laravel_auth/features/domain/entities/Categories.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'CategoriesModel.g.dart';

@JsonSerializable()
class CategoriesModel extends Categories {
  final int id;
  final String name;
  final String banner;
  final String icon;
  final String feature;
  final String top;

  CategoriesModel({
    @required this.id,
    @required this.name,
    @required this.banner,
    @required this.icon,
    @required this.feature,
    @required this.top,
  }) : super(
          id: id,
          name: name,
          banner: banner,
          icon: icon,
          feature: feature,
          top: top,
        );
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
