import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/Constants.dart';
import '../models/AuthTokenModel.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthToken(AuthTokenModel authTokenModel);
  Future<AuthTokenModel> getAuthToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheAuthToken(AuthTokenModel authTokenModel) {
    return sharedPreferences.setString(
      CACHE_AUTH_TOKEN,
      json.encode(authTokenModel.toJson()),
    );
  }

  @override
  Future<AuthTokenModel> getAuthToken() {
    String authObject = sharedPreferences.getString(CACHE_AUTH_TOKEN);
    if (authObject != null) {
      return Future.value(AuthTokenModel.fromJson(json.decode(authObject)));
    } else {
      return null;
    }
  }
}
