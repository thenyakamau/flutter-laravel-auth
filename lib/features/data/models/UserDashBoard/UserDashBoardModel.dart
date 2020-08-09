import 'package:json_annotation/json_annotation.dart';

part 'UserDashBoardModel.g.dart';

@JsonSerializable()
class UserDashBoardModel {
  String shopStatus;
  String logo;
  String sname;
  String name;
  String email;
  String image;

  UserDashBoardModel(
      {this.shopStatus,
      this.logo,
      this.sname,
      this.name,
      this.email,
      this.image});

  factory UserDashBoardModel.fromJson(Map<String, dynamic> json) =>
      _$UserDashBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDashBoardModelToJson(this);
}
