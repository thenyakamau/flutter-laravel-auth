// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDashBoardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDashBoardModel _$UserDashBoardModelFromJson(Map<String, dynamic> json) {
  return UserDashBoardModel(
    shopStatus: json['shopStatus'] as String,
    logo: json['logo'] as String,
    sname: json['sname'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$UserDashBoardModelToJson(UserDashBoardModel instance) =>
    <String, dynamic>{
      'shopStatus': instance.shopStatus,
      'logo': instance.logo,
      'sname': instance.sname,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
    };
