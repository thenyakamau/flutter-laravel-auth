// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BusinessSettingsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessSettingsModel _$BusinessSettingsModelFromJson(
    Map<String, dynamic> json) {
  return BusinessSettingsModel(
    id: json['id'] as int,
    type: json['type'] as String,
    value: json['value'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$BusinessSettingsModelToJson(
        BusinessSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'value': instance.value,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
