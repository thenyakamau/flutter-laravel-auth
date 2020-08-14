// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) {
  return CategoriesModel(
    id: json['id'] as int,
    name: json['name'] as String,
    banner: json['banner'] as String,
    icon: json['icon'] as String,
    feature: json['feature'] as String,
    top: json['top'] as String,
  );
}

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'banner': instance.banner,
      'icon': instance.icon,
      'feature': instance.feature,
      'top': instance.top,
    };
