part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class GetDashBoardDetailsEvent extends DashboardEvent {
  @override
  List<Object> get props => [];
}
