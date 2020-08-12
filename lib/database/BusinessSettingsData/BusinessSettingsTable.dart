import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('BusinessSettingTable')
class BusinessSettingsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get type => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {id};
}
