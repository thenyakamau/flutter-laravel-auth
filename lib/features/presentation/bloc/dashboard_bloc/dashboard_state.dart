part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashBoardLoadingState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashBoardLoadedState extends DashboardState {
  final DashBoard dashBoard;

  DashBoardLoadedState({@required this.dashBoard});
  @override
  List<Object> get props => [dashBoard];
}

class DashBoardErrorState extends DashboardState {
  final String message;

  DashBoardErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
