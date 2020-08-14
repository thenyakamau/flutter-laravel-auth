// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubCategoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoriesModel _$SubCategoriesModelFromJson(Map<String, dynamic> json) {
  return SubCategoriesModel(
    id: json['id'] as int,
    name: json['name'] as String,
    category_id: json['category_id'] as String,
  );
}

Map<String, dynamic> _$SubCategoriesModelToJson(SubCategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.category_id,
    };
