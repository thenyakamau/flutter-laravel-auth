import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/usecases/UseCases.dart';
import '../../../../core/utils/AuthentcationCheck.dart';
import '../../../../core/utils/Constants.dart';
import '../../../data/models/User/UserModel.dart';
import '../../../domain/entities/ApiSuccess.dart';
import '../../../domain/usecases/LoginUser.dart';
import '../../../domain/usecases/RefreshAuthentication.dart';
import '../../../domain/usecases/RegisterUser.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthentication checkAuthentication;
  final LoginUser loginUser;
  final RegisterUser registerUser;
  final RefreshAuthentication refreshAuthentication;
  AuthBloc({
    @required this.checkAuthentication,
    @required this.loginUser,
    @required this.registerUser,
    @required this.refreshAuthentication,
  }) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield AuthLoadingState();
      final formatEither = checkAuthentication.checkLoginAuthentication(
        event.email,
        event.password,
      );
      yield* formatEither.fold((failure) async* {
        final String title = failure[0].toString();
        final String message = failure[1].toString();
        yield AuthErrorState(message: message, title: title);
      }, (success) async* {
        final authEither = await loginUser(
          LoginParams(email: event.email, password: event.password),
        );
        yield* _getAuthOrFail(authEither);
      });
    } else if (event is RegisterEvent) {
      yield AuthLoadingState();
      final formatEither = checkAuthentication.checkRegAuthentication(
        event.name,
        event.email,
        event.phone,
        event.password,
        event.cPassword,
      );
      yield* formatEither.fold((failure) async* {
        final String title = failure[0].toString();
        final String message = failure[1].toString();
        yield AuthErrorState(message: message, title: title);
      }, (user) async* {
        yield AuthCreateShopState(userModel: user);
      });
    } else if (event is CreateShopEvent) {
      yield AuthLoadingState();

      final formatEither = checkAuthentication.checkShopAuthentiction(
          event.shop_name,
          event.shop_address,
          event.shop_number,
          event.mpesa_number,
          event.allow_imports,
          event.bank_name,
          event.bank_user_name,
          event.bank_account_number);

      yield* formatEither.fold((failure) async* {
        final String title = failure[0].toString();
        final String message = failure[1].toString();
        yield AuthErrorState(message: message, title: title);
      }, (shop) async* {
        final authEither = await registerUser(
          RegisterParams(userModel: event.user, shop: shop),
        );
        yield* _getAuthOrFail(authEither);
      });
    } else if (event is RefreshTokenEvent) {
      final authEither = await refreshAuthentication(NoParams());
      yield* authEither.fold((failure) async* {
        if (failure is UnAuthenticatedFailure) {
          yield UnAuthenticatedState();
        } else {
          yield AuthErrorState(
              message: _mapFailureToMessage(failure), title: "Error");
        }
      }, (success) async* {
        yield AuthLoadedState(message: success.message);
      });
    }
  }
}

Stream<AuthState> _getAuthOrFail(
    Either<Failure, ApiSuccess> authEither) async* {
  yield authEither.fold(
    (failure) =>
        AuthErrorState(message: _mapFailureToMessage(failure), title: "Error"),
    (apiSuccess) => AuthLoadedState(message: apiSuccess.message),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
