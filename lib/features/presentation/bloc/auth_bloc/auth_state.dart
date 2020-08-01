part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  final String message, title;

  AuthInitial({this.message, this.title});
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  final String message, title;

  AuthLoadingState({this.message, this.title});
  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  final String message, title;

  AuthErrorState({@required this.message, @required this.title});
  @override
  List<Object> get props => [message, title];
}

class AuthLoadedState extends AuthState {
  final String message, title;

  AuthLoadedState({@required this.message, this.title});
  @override
  List<Object> get props => [message];
}

class UnAuthenticatedState extends AuthState {
  final String message, title;

  UnAuthenticatedState({this.message, this.title});
  @override
  List<Object> get props => [];
}
