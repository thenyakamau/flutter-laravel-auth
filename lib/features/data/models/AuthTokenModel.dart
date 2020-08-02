import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'AuthTokenModel.g.dart';

@JsonSerializable()
class AuthTokenModel {
  final String token_type;
  final int expires_in;
  final String access_token;
  final String refresh_token;

  AuthTokenModel({
    @required this.token_type,
    @required this.expires_in,
    @required this.access_token,
    @required this.refresh_token,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenModelToJson(this);
}
