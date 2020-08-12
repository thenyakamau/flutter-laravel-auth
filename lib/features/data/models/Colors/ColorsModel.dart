import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/CustomColors.dart';

part 'ColorsModel.g.dart';

@JsonSerializable()
class CustomColorsModel extends CustomColors {
  final int id;
  final String name;
  final String code;

  CustomColorsModel({
    @required this.id,
    @required this.name,
    @required this.code,
  }) : super(id: id, name: name, code: code);
  factory CustomColorsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomColorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomColorsModelToJson(this);
}
