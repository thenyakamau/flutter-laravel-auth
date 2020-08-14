import 'package:meta/meta.dart';

import '../../../../core/errors/Exceptions.dart';
import '../../models/Categories/CategoriesModel.dart';
import '../../models/Colors/CustomColorsModel.dart';
import '../../models/SubCategory/SubCategoriesModel.dart';
import '../api/AppApiService.dart';

abstract class AddProductRemoteDataSource {
  Future<List<CustomColorsModel>> getCustomColors();
  Future<List<CategoriesModel>> getCategories();
  Future<List<SubCategoriesModel>> getSubCategories(int id);
}

class AddProductRemoteDataSourceImpl implements AddProductRemoteDataSource {
  final AppApiService apiService;

  AddProductRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<List<CustomColorsModel>> getCustomColors() async {
    final response = await apiService.getDisplayColors();

    if (response.statusCode == 200) {
      List<CustomColorsModel> customColors = (response.body as List)
          .map((e) => CustomColorsModel.fromJson(e))
          .toList();
      return customColors;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    final response = await apiService.getProductCategories();
    if (response.statusCode == 200) {
      List<CategoriesModel> categories = (response.body as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList();
      return categories;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SubCategoriesModel>> getSubCategories(int id) async {
    final response = await apiService.getProductSubCategories(id);
    if (response.statusCode == 200) {
      List<SubCategoriesModel> subCategories = (response.body as List)
          .map((e) => SubCategoriesModel.fromJson(e))
          .toList();
      return subCategories;
    } else {
      throw ServerException();
    }
  }
}
