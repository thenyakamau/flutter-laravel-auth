import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/DashBoard.dart';
import '../UserDashBoard/UserDashBoardModel.dart';

part 'DashBoardModel.g.dart';

@JsonSerializable()
class DashBoardModel extends DashBoard {
  final int countproducts;
  final int countpay;
  final int counttotalorders;
  final int countdeliveredorder;
  final int countcancelledorder;
  final int countpendingorder;
  final int countreturnedorder;
  final UserDashBoardModel userDashBoardModel;
  final String verificationStatus;

  DashBoardModel({
    @required this.countproducts,
    @required this.countpay,
    @required this.counttotalorders,
    @required this.countdeliveredorder,
    @required this.countcancelledorder,
    @required this.countpendingorder,
    @required this.countreturnedorder,
    @required this.userDashBoardModel,
    @required this.verificationStatus,
  }) : super(
          countproducts: countproducts,
          countpay: countpay,
          counttotalorders: counttotalorders,
          countdeliveredorder: countdeliveredorder,
          countcancelledorder: countcancelledorder,
          countpendingorder: countpendingorder,
          countreturnedorder: countreturnedorder,
          userDashBoardModel: userDashBoardModel,
          verificationStatus: verificationStatus,
        );

  factory DashBoardModel.fromJson(Map<String, dynamic> json) =>
      _$DashBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashBoardModelToJson(this);
}
