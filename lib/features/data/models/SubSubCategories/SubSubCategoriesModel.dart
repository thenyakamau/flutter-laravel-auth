import '../../../domain/entities/SubSubCategories.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SubSubCategoriesModel.g.dart';

@JsonSerializable()
class SubSubCategoriesModel extends SubSubCategories {
  final int id;
  final String name;
  final int sub_category_id;
  final String brands;

  SubSubCategoriesModel({
    @required this.id,
    @required this.name,
    @required this.sub_category_id,
    @required this.brands,
  });
  factory SubSubCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$SubSubCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubSubCategoriesModelToJson(this);
}
