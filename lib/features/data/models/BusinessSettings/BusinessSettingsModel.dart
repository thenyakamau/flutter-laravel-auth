import 'package:flutter_laravel_auth/features/domain/entities/BusinessSettings.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'BusinessSettingsModel.g.dart';

@JsonSerializable()
class BusinessSettingsModel extends BusinessSettings {
  final int id;
  final String type;
  final String value;

  BusinessSettingsModel({
    @required this.id,
    @required this.type,
    @required this.value,
  }) : super(id: id, type: type, value: value);

  factory BusinessSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessSettingsModelToJson(this);
}
