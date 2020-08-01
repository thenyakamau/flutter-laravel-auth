import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../models/AuthTokenModel.dart';
import '../models/UserModel.dart';
import 'AppApiService.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> registerUser(UserModel userModel);
  Future<AuthTokenModel> loginUser(String email, String password);
  Future<AuthTokenModel> refreshUser(AuthTokenModel authTokenModel);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AppApiService apiService;

  AuthRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<AuthTokenModel> loginUser(String email, String password) async {
    final response = await apiService.loginUser(email, password);
    if (response.statusCode == 200) {
      var result = AuthTokenModel.fromJson(response.body);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthTokenModel> registerUser(UserModel userModel) async {
    final response = await apiService.registerUser(userModel.toJson());
    if (response.statusCode == 200) {
      var result = AuthTokenModel.fromJson(response.body);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthTokenModel> refreshUser(AuthTokenModel authTokenModel) async {
    final response = await apiService.refreshUser(authTokenModel.refreshToken);
    if (response.statusCode == 200) {
      var result = AuthTokenModel.fromJson(response.body);
      return result;
    } else {
      throw ServerException();
    }
  }
}
