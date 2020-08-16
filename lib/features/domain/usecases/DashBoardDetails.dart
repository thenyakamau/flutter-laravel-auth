import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/DashBoard.dart';
import '../repositories/HomeRepository.dart';

@lazySingleton
class DashBoardDetails extends UseCase<DashBoard, NoParams> {
  final HomeRepository homeRepository;

  DashBoardDetails({@required this.homeRepository});
  @override
  Future<Either<Failure, DashBoard>> call(NoParams params) {
    return homeRepository.getDashBoardDetails();
  }
}
