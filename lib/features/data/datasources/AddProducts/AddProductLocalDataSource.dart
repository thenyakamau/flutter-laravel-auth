import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../database/CategoryData/CategoriesDao.dart';
import '../../../../database/CustomColorsData/CustomColorsDao.dart';
import '../../../../database/EcommerceDatabase.dart';
import '../../models/Categories/CategoriesModel.dart';
import '../../models/Colors/CustomColorsModel.dart';

abstract class AddProductLocalDataSource {
  Future<List<CustomColorsModel>> getCustomColorsCache();
  Future<void> cacheCustomCOlors(List<CustomColorsModel> customColors);
  Future<List<CategoriesModel>> getCategoriesCache();
  Future<void> cacheCategories(List<CategoriesModel> categories);
}

@LazySingleton(as: AddProductLocalDataSource)
class AddProductLocalDataSourceImpl implements AddProductLocalDataSource {
  final CustomColorsDao colorsDao;
  final CategoriesDao categoriesDao;

  AddProductLocalDataSourceImpl({
    @required this.colorsDao,
    @required this.categoriesDao,
  });

  @override
  Future<void> cacheCustomCOlors(List<CustomColorsModel> customColors) async {
    await colorsDao.deleteAll();
    for (var i = 0; i < customColors.length; i++) {
      try {
        CustomColorsModel e = customColors[i];
        await colorsDao.insertColor(CustomColorTable(
          id: e.id,
          name: e.name,
          code: e.name,
        ));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Future<List<CustomColorsModel>> getCustomColorsCache() async {
    List<CustomColorTable> customColors = await colorsDao.getColors();
    List<CustomColorsModel> colorsModel = [];
    for (var i = 0; i < customColors.length; i++) {
      CustomColorTable e = customColors[i];
      colorsModel.add(CustomColorsModel(id: e.id, name: e.name, code: e.code));
    }
    return colorsModel;
  }

  @override
  Future<void> cacheCategories(List<CategoriesModel> categories) async {
    await categoriesDao.deleteAll();
    for (var i = 0; i < categories.length; i++) {
      try {
        CategoriesModel e = categories[i];
        await categoriesDao.insertCategory(CategoryTable(
          id: e.id,
          name: e.name,
          icon: e.icon,
          feature: e.feature,
          top: e.top,
        ));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Future<List<CategoriesModel>> getCategoriesCache() async {
    List<CategoryTable> categoryData = await categoriesDao.getAllCategories();
    List<CategoriesModel> categories = [];
    for (var i = 0; i < categoryData.length; i++) {
      CategoryTable e = categoryData[i];
      categories.add(CategoriesModel(
        id: e.id,
        name: e.name,
        icon: e.icon,
        feature: e.feature,
        top: e.top,
      ));
    }
    return categories;
  }
}
