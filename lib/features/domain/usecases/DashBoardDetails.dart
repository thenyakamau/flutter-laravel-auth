import 'package:flutter_laravel_auth/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_laravel_auth/core/usecases/UseCases.dart';
import 'package:flutter_laravel_auth/features/data/models/DashBoardModel.dart';

class DashBoardDetails extends UseCase<DashBoardModel, NoParams> {
  @override
  Future<Either<Failure, DashBoardModel>> call(NoParams params) {}
}
