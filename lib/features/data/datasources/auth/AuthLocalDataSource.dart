import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/Exceptions.dart';
import '../../../../core/utils/Constants.dart';
import '../../../../database/BusinessSettingsData/BusinessSettingsDao.dart';
import '../../../../database/EcommerceDatabase.dart';
import '../../models/AuthToken/AuthTokenModel.dart';
import '../../models/BusinessSettings/BusinessSettingsModel.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthToken(AuthTokenModel authTokenModel);
  Future<AuthTokenModel> getAuthToken();
  Future<void> cacheBusinessSettings(
      List<BusinessSettingsModel> businessSettings);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final BusinessSettingsDao businessSettingsDao;

  AuthLocalDataSourceImpl({
    @required this.sharedPreferences,
    @required this.businessSettingsDao,
  });

  @override
  Future<void> cacheAuthToken(AuthTokenModel authTokenModel) {
    try {
      return sharedPreferences.setString(
        CACHE_AUTH_TOKEN,
        json.encode(authTokenModel.toJson()),
      );
    } catch (e) {
      throw CacheException();
    }
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

  @override
  Future<void> cacheBusinessSettings(
      List<BusinessSettingsModel> businessSettings) async {
    await businessSettingsDao.deleteAll();

    for (var i = 0; i < businessSettings.length; i++) {
      try {
        BusinessSettingsModel e = businessSettings[i];
        await businessSettingsDao
            .insertBusinessSetting(new BusinessSettingTable(
          id: e.id,
          type: e.type,
          value: e.value,
          created_at: e.createdAt,
          updated_at: e.updatedAt,
        ));
      } catch (e) {
        throw CacheException();
      }
    }
  }
}
