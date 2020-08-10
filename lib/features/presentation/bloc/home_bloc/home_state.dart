part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final DashBoard dashBoard;

  HomeLoadedState({@required this.dashBoard});
  @override
  List<Object> get props => [dashBoard];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
