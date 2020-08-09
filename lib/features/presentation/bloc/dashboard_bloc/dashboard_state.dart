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
  @override
  List<Object> get props => [];
}

class DashBoardErrorState extends DashboardState {
  @override
  List<Object> get props => [];
}
