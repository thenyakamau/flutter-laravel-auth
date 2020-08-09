import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/UserDashBoardModel.dart';

class DashBoard extends Equatable {
  final int countproducts;
  final int countpay;
  final int counttotalorders;
  final int countdeliveredorder;
  final int countcancelledorder;
  final int countpendingorder;
  final int countreturnedorder;
  final UserDashBoardModel userDashBoardModel;
  final String verificationStatus;

  DashBoard({
    @required this.countproducts,
    @required this.countpay,
    @required this.counttotalorders,
    @required this.countdeliveredorder,
    @required this.countcancelledorder,
    @required this.countpendingorder,
    @required this.countreturnedorder,
    @required this.userDashBoardModel,
    @required this.verificationStatus,
  });

  @override
  List<Object> get props => [
        countproducts,
        countpay,
        counttotalorders,
        countdeliveredorder,
        countcancelledorder,
        countpendingorder,
        countreturnedorder,
        userDashBoardModel,
        verificationStatus,
      ];
}
