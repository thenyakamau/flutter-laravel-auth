import 'package:moor_flutter/moor_flutter.dart';

import '../EcommerceDatabase.dart';
import 'BusinessSettingsTable.dart';

part 'BusinessSettingsDao.g.dart';

@UseDao(tables: [BusinessSettingsTable])
class BusinessSettingsDao extends DatabaseAccessor<EcommerceDatabase>
    with _$BusinessSettingsDaoMixin {
  BusinessSettingsDao(EcommerceDatabase db) : super(db);

  Future<List<BusinessSettingTable>> getAllBusinessSettings() =>
      select(businessSettingsTable).get();

  Future<List<BusinessSettingTable>> getBusinnessSetting(int id) =>
      (select(businessSettingsTable)..where((tbl) => tbl.id.equals(id))).get();

  Future insertBusinessSetting(BusinessSettingTable businessSettingTable) =>
      into(businessSettingsTable).insert(businessSettingTable);

  Future deleteAll() => delete(businessSettingsTable).go();
}
