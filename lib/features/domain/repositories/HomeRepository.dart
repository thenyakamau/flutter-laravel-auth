import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../entities/DashBoard.dart';

abstract class HomeRepository {
  Future<Either<Failure, DashBoard>> getDashBoardDetails();
}
