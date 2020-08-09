// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DashBoardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardModel _$DashBoardModelFromJson(Map<String, dynamic> json) {
  return DashBoardModel(
    countproducts: json['countproducts'] as int,
    countpay: json['countpay'] as int,
    counttotalorders: json['counttotalorders'] as int,
    countdeliveredorder: json['countdeliveredorder'] as int,
    countcancelledorder: json['countcancelledorder'] as int,
    countpendingorder: json['countpendingorder'] as int,
    countreturnedorder: json['countreturnedorder'] as int,
    userDashBoardModel: json['userDashBoardModel'] == null
        ? null
        : UserDashBoardModel.fromJson(
            json['userDashBoardModel'] as Map<String, dynamic>),
    verificationStatus: json['verificationStatus'] as String,
  );
}

Map<String, dynamic> _$DashBoardModelToJson(DashBoardModel instance) =>
    <String, dynamic>{
      'countproducts': instance.countproducts,
      'countpay': instance.countpay,
      'counttotalorders': instance.counttotalorders,
      'countdeliveredorder': instance.countdeliveredorder,
      'countcancelledorder': instance.countcancelledorder,
      'countpendingorder': instance.countpendingorder,
      'countreturnedorder': instance.countreturnedorder,
      'userDashBoardModel': instance.userDashBoardModel,
      'verificationStatus': instance.verificationStatus,
    };
