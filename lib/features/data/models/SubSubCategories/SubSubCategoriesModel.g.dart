// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubSubCategoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubSubCategoriesModel _$SubSubCategoriesModelFromJson(
    Map<String, dynamic> json) {
  return SubSubCategoriesModel(
    id: json['id'] as int,
    name: json['name'] as String,
    sub_category_id: json['sub_category_id'] as int,
    brands: json['brands'] as String,
  );
}

Map<String, dynamic> _$SubSubCategoriesModelToJson(
        SubSubCategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sub_category_id': instance.sub_category_id,
      'brands': instance.brands,
    };
