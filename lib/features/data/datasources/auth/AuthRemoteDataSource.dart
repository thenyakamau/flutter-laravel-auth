import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Exceptions.dart';
import '../../models/AuthToken/AuthTokenModel.dart';
import '../../models/Shop/ShopModel.dart';
import '../../models/User/UserModel.dart';
import '../api/AppApiService.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> registerUser(UserModel userModel, ShopModel shop);
  Future<AuthTokenModel> loginUser(String email, String password);
  Future<AuthTokenModel> refreshUser(AuthTokenModel authTokenModel);
  Future<Response> splashRefresh(AuthTokenModel authTokenModel);
}

@LazySingleton(as: AuthRemoteDataSource)
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
  Future<AuthTokenModel> registerUser(
      UserModel userModel, ShopModel shopModel) async {
    final body = {...userModel.toJson(), ...shopModel.toJson()};
    final response = await apiService.registerUser(body);
    if (response.statusCode == 200) {
      var result = AuthTokenModel.fromJson(response.body);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthTokenModel> refreshUser(AuthTokenModel authTokenModel) async {
    final response = await apiService.refreshUser(authTokenModel.refresh_token);
    if (response.statusCode == 200) {
      var result = AuthTokenModel.fromJson(response.body);
      return result;
    } else if (response.statusCode == 401) {
      throw UnAuthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Response> splashRefresh(AuthTokenModel authTokenModel) async {
    final response =
        await apiService.splashRefresh(authTokenModel.refresh_token);
    if (response.statusCode == 200) {
      print(response.body['businessSettings']);
      return response;
    } else if (response.statusCode == 401) {
      throw UnAuthenticatedException();
    } else {
      throw ServerException();
    }
  }
}
