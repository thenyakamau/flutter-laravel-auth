import 'package:flutter_laravel_auth/features/domain/entities/BusinessSettings.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'BusinessSettingsModel.g.dart';

@JsonSerializable()
class BusinessSettingsModel extends BusinessSettings {
  final int id;
  final String type;
  final String value;
  final String createdAt;
  final String updatedAt;

  BusinessSettingsModel({
    @required this.id,
    @required this.type,
    @required this.value,
    @required this.createdAt,
    @required this.updatedAt,
  }) : super(
          id: id,
          type: type,
          value: value,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory BusinessSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessSettingsModelToJson(this);
}
