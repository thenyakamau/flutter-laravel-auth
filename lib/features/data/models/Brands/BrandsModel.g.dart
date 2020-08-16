// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BrandsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandsModel _$BrandsModelFromJson(Map<String, dynamic> json) {
  return BrandsModel(
    id: json['id'] as int,
    name: json['name'] as String,
    logo: json['logo'] as String,
    top: json['top'] as int,
  );
}

Map<String, dynamic> _$BrandsModelToJson(BrandsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'top': instance.top,
    };
