import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('BusinessSettingTable')
class BusinessSettingsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get type => text()();
  IntColumn get value => integer()();
  TextColumn get created_at => text()();
  TextColumn get updated_at => text()();

  @override
  Set<Column> get primaryKey => {id};
}
