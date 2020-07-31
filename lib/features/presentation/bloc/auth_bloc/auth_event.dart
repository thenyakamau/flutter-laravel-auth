part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String email, password;

  LoginEvent({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final String name, email, phone, password, cPassword;

  RegisterEvent({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.password,
    @required this.cPassword,
  });

  @override
  List<Object> get props => [name, email, phone, password, cPassword];
}

class RefreshTokenEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
