// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) {
  return CategoriesModel(
    id: json['id'] as int,
    name: json['name'] as String,
    icon: json['icon'] as String,
    feature: json['feature'] as String,
    top: json['top'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'feature': instance.feature,
      'top': instance.top,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
