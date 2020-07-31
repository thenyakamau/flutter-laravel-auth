import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/utils/AuthentcationCheck.dart';
import '../../../../core/utils/Constants.dart';
import '../../../domain/entities/ApiSuccess.dart';
import '../../../domain/usecases/LoginUser.dart';
import '../../../domain/usecases/RegisterUser.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthentication checkAuthentication;
  final LoginUser loginUser;
  final RegisterUser registerUser;
  AuthBloc({
    @required this.checkAuthentication,
    @required this.loginUser,
    @required this.registerUser,
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
        yield AuthErrorState(message: failure);
      }, (success) async* {
        final authEither = await loginUser(
          LoginParams(email: event.email, password: event.password),
        );
        yield _getAuthOrFail(authEither);
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
        yield AuthErrorState(message: failure);
      }, (user) async* {
        final authEither = await registerUser(RegisterParams(userModel: user));
        yield _getAuthOrFail(authEither);
      });
    } else if (event is RefreshTokenEvent) {}
  }
}

Stream<AuthState> _getAuthOrFail(
    Either<Failure, ApiSuccess> authEither) async* {
  yield authEither.fold(
    (failure) => AuthErrorState(message: _mapFailureToMessage(failure)),
    (authToken) => AuthLoadedState(message: "Welcome back"),
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
