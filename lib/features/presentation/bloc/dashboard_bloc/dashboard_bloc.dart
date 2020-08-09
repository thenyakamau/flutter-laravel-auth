import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/usecases/UseCases.dart';
import '../../../../core/utils/Constants.dart';
import '../../../domain/entities/DashBoard.dart';
import '../../../domain/usecases/DashBoardDetails.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashBoardDetails dashBoardDetails;
  DashboardBloc({@required this.dashBoardDetails}) : super(DashboardInitial());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is GetDashBoardDetailsEvent) {
      yield DashBoardLoadingState();
      final dashBoardEither = await dashBoardDetails(NoParams());
      yield* dashBoardEither.fold((failure) async* {
        yield DashBoardErrorState(message: _mapFailureToMessage(failure));
      }, (dashBoard) async* {
        yield DashBoardLoadedState(dashBoard: dashBoard);
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
