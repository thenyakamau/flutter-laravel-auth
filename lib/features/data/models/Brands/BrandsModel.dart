import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/Brands.dart';

part 'BrandsModel.g.dart';

@JsonSerializable()
class BrandsModel extends Brands {
  final int id;
  final String name;
  final String logo;
  final String top;

  BrandsModel({
    @required this.id,
    @required this.name,
    @required this.logo,
    @required this.top,
  });

  factory BrandsModel.fromJson(Map<String, dynamic> json) =>
      _$BrandsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsModelToJson(this);
}
