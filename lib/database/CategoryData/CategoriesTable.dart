import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('CategoryTable')
class CategoriesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get banner => text()();
  TextColumn get icon => text()();
  IntColumn get feature => integer()();
  IntColumn get top => integer()();
  TextColumn get created_at => text()();
  TextColumn get updated_at => text()();

  @override
  Set<Column> get primaryKey => {id};
}
