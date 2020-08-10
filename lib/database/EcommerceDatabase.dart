import 'package:flutter_laravel_auth/database/BusinessSettingsData/BusinessSettingsDao.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'BusinessSettingsData/BusinessSettingsTable.dart';
import 'CategoryData/CategoriesDao.dart';
import 'CategoryData/CategoriesTable.dart';

part 'EcommerceDatabase.g.dart';

@UseMoor(
    tables: [CategoriesTable, BusinessSettingsTable],
    daos: [CategoriesDao, BusinessSettingsDao])
class EcommerceDatabase extends _$EcommerceDatabase {
  EcommerceDatabase()
      : super(
          (FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          )),
        );

  @override
  int get schemaVersion => 1;
}
