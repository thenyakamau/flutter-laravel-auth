part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}

class AuthLoadedState extends AuthState {
  final String message;

  AuthLoadedState({@required this.message});
  @override
  List<Object> get props => [message];
}

class UnAuthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}
