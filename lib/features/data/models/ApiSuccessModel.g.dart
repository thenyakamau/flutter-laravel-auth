// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiSuccessModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSuccessModel _$ApiSuccessModelFromJson(Map<String, dynamic> json) {
  return ApiSuccessModel(
    success: json['success'] as bool,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ApiSuccessModelToJson(ApiSuccessModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
