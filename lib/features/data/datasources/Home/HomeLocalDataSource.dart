import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/Exceptions.dart';
import '../../../../core/utils/Constants.dart';
import '../../models/DashBoard/DashBoardModel.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheDashBoard(DashBoardModel dashBoardModel);
  Future<DashBoardModel> getDashBoardCache();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPreferences sharedPreferences;

  HomeLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheDashBoard(DashBoardModel dashBoardModel) {
    try {
      return sharedPreferences.setString(
          CACHE_DASH_BOARD_DATA, json.encode(dashBoardModel.toJson()));
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<DashBoardModel> getDashBoardCache() {
    final dashBoardData = sharedPreferences.get(CACHE_DASH_BOARD_DATA);
    if (dashBoardData != null) {
      return Future.value(DashBoardModel.fromJson(json.decode(dashBoardData)));
    } else {
      return null;
    }
  }
}
