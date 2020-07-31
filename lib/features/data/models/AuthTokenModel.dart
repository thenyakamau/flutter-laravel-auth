import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'AuthTokenModel.g.dart';

@JsonSerializable()
class AuthTokenModel {
  final String tokenType;
  final int expiresIn;
  final String accessToken;
  final String refreshToken;

  AuthTokenModel({
    @required this.tokenType,
    @required this.expiresIn,
    @required this.accessToken,
    @required this.refreshToken,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenModelToJson(this);
}
