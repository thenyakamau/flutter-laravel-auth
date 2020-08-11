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

class CreateShopEvent extends AuthEvent {
  final String shop_name,
      shop_address,
      shop_number,
      mpesa_number,
      bank_name,
      bank_user_name,
      bank_account_number,
      allow_imports;
  final UserModel user;

  CreateShopEvent({
    @required this.shop_name,
    @required this.shop_address,
    @required this.shop_number,
    @required this.mpesa_number,
    @required this.bank_name,
    @required this.bank_user_name,
    @required this.bank_account_number,
    @required this.allow_imports,
    @required this.user,
  });
  @override
  List<Object> get props => [
        shop_name,
        shop_address,
        shop_number,
        mpesa_number,
        bank_name,
        bank_user_name,
        bank_account_number,
        allow_imports,
        user
      ];
}

class RefreshTokenEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class SplashRefreshEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
