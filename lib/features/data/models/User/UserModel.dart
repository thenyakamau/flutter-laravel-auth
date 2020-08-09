import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/User.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel extends User {
  final String name;
  final String email;
  final String number;
  final String password;

  UserModel({
    @required this.name,
    @required this.email,
    @required this.number,
    @required this.password,
  }) : super(
          name: name,
          email: email,
          number: number,
          password: password,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
