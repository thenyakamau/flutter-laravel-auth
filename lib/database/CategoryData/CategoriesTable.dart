import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('CategoryTable')
class CategoriesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get banner => text().nullable()();
  TextColumn get icon => text().nullable()();
  TextColumn get feature => text().nullable()();
  TextColumn get top => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
