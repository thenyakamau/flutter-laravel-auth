import 'package:moor_flutter/moor_flutter.dart';

import 'BusinessSettingsData/BusinessSettingsDao.dart';
import 'BusinessSettingsData/BusinessSettingsTable.dart';
import 'CategoryData/CategoriesDao.dart';
import 'CategoryData/CategoriesTable.dart';
import 'CustomColorsData/CustomColorsDao.dart';
import 'CustomColorsData/CustomColorsTable.dart';

part 'EcommerceDatabase.g.dart';

@UseMoor(
    tables: [CategoriesTable, BusinessSettingsTable, CustomColorsTables],
    daos: [CategoriesDao, BusinessSettingsDao, CustomColorsDao])
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
