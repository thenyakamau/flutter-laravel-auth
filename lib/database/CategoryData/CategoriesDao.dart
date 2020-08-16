import 'package:injectable/injectable.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../EcommerceDatabase.dart';
import 'CategoriesTable.dart';

part 'CategoriesDao.g.dart';

@UseDao(tables: [CategoriesTable])
@lazySingleton
class CategoriesDao extends DatabaseAccessor<EcommerceDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(EcommerceDatabase db) : super(db);

  Future<List<CategoryTable>> getAllCategories() =>
      select(categoriesTable).get();

  Future<List<CategoryTable>> getSingleCategory(int id) =>
      (select(categoriesTable)..where((tbl) => tbl.id.equals(id))).get();

  Future insertCategory(CategoryTable categoryTable) =>
      into(categoriesTable).insert(categoryTable);
  Future deleteAll() => delete(categoriesTable).go();
}
