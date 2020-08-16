import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Exceptions.dart';
import '../../models/Categories/CategoriesModel.dart';
import '../../models/Colors/CustomColorsModel.dart';
import '../../models/SubCategory/SubCategoriesModel.dart';
import '../../models/SubSubCategories/SubSubCategoriesModel.dart';
import '../api/AppApiService.dart';

abstract class AddProductRemoteDataSource {
  Future<List<CustomColorsModel>> getCustomColors();
  Future<List<CategoriesModel>> getCategories();
  Future<List<SubCategoriesModel>> getSubCategories(int id);
  Future<List<SubSubCategoriesModel>> getSubSubCategories(int id);
}

@LazySingleton(as: AddProductRemoteDataSource)
class AddProductRemoteDataSourceImpl implements AddProductRemoteDataSource {
  final AppApiService apiService;

  AddProductRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<List<CustomColorsModel>> getCustomColors() async {
    final response = await apiService.getDisplayColors();

    if (response.statusCode == 200) {
      List<CustomColorsModel> customColors = [];
      try {
        customColors = (response.body as List)
            .map((e) => CustomColorsModel.fromJson(e))
            .toList();
      } catch (e) {
        print(e.toString());
      }
      return customColors;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    final response = await apiService.getProductCategories();
    if (response.statusCode == 200) {
      List<CategoriesModel> categories = [];
      try {
        categories = (response.body['categories'] as List)
            .map((e) => CategoriesModel.fromJson(e))
            .toList();
      } catch (e) {
        print(e.toString());
      }
      return categories;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SubCategoriesModel>> getSubCategories(int id) async {
    final response = await apiService.getProductSubCategories(id);
    if (response.statusCode == 200) {
      List<SubCategoriesModel> subCategories = [];
      try {
        subCategories = (response.body['sub_categories'] as List)
            .map((e) => SubCategoriesModel.fromJson(e))
            .toList();
      } catch (e) {
        print(e.toString());
      }
      return subCategories;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SubSubCategoriesModel>> getSubSubCategories(int id) async {
    final response = await apiService.getProductSubSubCategories(id);
    if (response.statusCode == 200) {
      List<SubSubCategoriesModel> subSubCategories = [];
      try {
        subSubCategories = (response.body['sub_sub_categories'] as List)
            .map((e) => SubSubCategoriesModel.fromJson(e))
            .toList();
      } catch (e) {
        print(e.toString());
      }
      return subSubCategories;
    } else {
      throw ServerException();
    }
  }
}
