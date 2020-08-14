import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/SubCategories.dart';

part 'SubCategoriesModel.g.dart';

@JsonSerializable()
class SubCategoriesModel extends SubCategories {
  final int id;
  final String name;
  final String category_id;

  SubCategoriesModel({
    @required this.id,
    @required this.name,
    @required this.category_id,
  }) : super(id: id, name: name, category_id: category_id);

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoriesModelToJson(this);
}
