import 'package:flutter_laravel_auth/features/domain/entities/ApiSuccess.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'ApiSuccessModel.g.dart';

@JsonSerializable()
class ApiSuccessModel extends ApiSuccess {
  final bool success;
  final String message;

  ApiSuccessModel({@required this.success, @required this.message})
      : super(message: message, success: success);

  factory ApiSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSuccessModelToJson(this);
}
