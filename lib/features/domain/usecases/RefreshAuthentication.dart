import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/ApiSuccess.dart';
import '../repositories/AuthRepository.dart';

@lazySingleton
class RefreshAuthentication extends UseCase<ApiSuccess, NoParams> {
  final AuthRepository authRepository;

  RefreshAuthentication({@required this.authRepository});

  @override
  Future<Either<Failure, ApiSuccess>> call(NoParams params) {
    return authRepository.refreshUser();
  }
}
