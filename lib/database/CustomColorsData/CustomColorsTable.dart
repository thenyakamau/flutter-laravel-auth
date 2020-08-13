import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('CustomColorTable')
class CustomColorsTables extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get code => text()();

  @override
  Set<Column> get primaryKey => {id};
}
