import 'package:meta/meta.dart';

import '../../../../core/errors/Exceptions.dart';
import '../../../domain/entities/DashBoard.dart';
import '../../models/AuthTokenModel.dart';
import '../../models/DashBoardModel.dart';
import '../api/AppApiService.dart';

abstract class HomeRemoteDataSource {
  Future<DashBoard> getDashBoardDetails(AuthTokenModel authTokenModel);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final AppApiService apiService;

  HomeRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<DashBoard> getDashBoardDetails(AuthTokenModel authTokenModel) async {
    final response = await apiService
        .getDashBoardData('Bearer ${authTokenModel.access_token}');
    if (response.statusCode == 200) {
      var result = DashBoardModel.fromJson(response.body);
      print(result);
      return result;
    } else {
      throw ServerException();
    }
  }
}
