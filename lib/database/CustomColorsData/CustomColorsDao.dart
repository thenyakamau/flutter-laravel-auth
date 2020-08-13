import 'package:moor_flutter/moor_flutter.dart';

import '../EcommerceDatabase.dart';
import 'CustomColorsTable.dart';

part 'CustomColorsDao.g.dart';

@UseDao(tables: [CustomColorsTables])
class CustomColorsDao extends DatabaseAccessor<EcommerceDatabase>
    with _$CustomColorsDaoMixin {
  CustomColorsDao(EcommerceDatabase db) : super(db);

  Future<List<CustomColorTable>> getColors() =>
      select(customColorsTables).get();

  Future<List<CustomColorTable>> getColor(int id) =>
      (select(customColorsTables)..where((tbl) => tbl.id.equals(id))).get();

  Future insertColor(CustomColorTable colorTable) =>
      into(customColorsTables).insert(colorTable);
  Future deleteAll() => delete(customColorsTables).go();
}
