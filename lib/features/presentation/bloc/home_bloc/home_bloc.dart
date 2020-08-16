import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/usecases/UseCases.dart';
import '../../../../core/utils/Constants.dart';
import '../../../domain/entities/DashBoard.dart';
import '../../../domain/usecases/DashBoardDetails.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DashBoardDetails dashBoardDetails;
  HomeBloc({@required this.dashBoardDetails}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetDashBoardDetailsEvent) {
      yield HomeLoadingState();
      final dashBoardEither = await dashBoardDetails(NoParams());
      yield* dashBoardEither.fold((failure) async* {
        if (failure is UnAuthenticatedFailure) {
          yield HomeUnAuthenticatedState();
        } else {
          yield HomeErrorState(message: _mapFailureToMessage(failure));
        }
      }, (dashBoard) async* {
        yield HomeLoadedState(dashBoard: dashBoard);
      });
    }
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
}
