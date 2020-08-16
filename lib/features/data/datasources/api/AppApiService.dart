import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../core/utils/Constants.dart';

part 'AppApiService.chopper.dart';

@ChopperApi(baseUrl: '/')
@lazySingleton
abstract class AppApiService extends ChopperService {
  @Post(path: 'seller/register')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> registerUser(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'seller/login')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> loginUser(
    @Field('username') String email,
    @Field() String password,
  );

  @Post(path: 'seller/refresh')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> refreshUser(@Field('refresh_token') String refreshToken);

  @Post(path: 'seller/splashRefresh')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> splashRefresh(@Field('refresh_token') String refreshToken);

  @Get(path: 'seller/dashboard')
  Future<Response> getDashBoardData([
    @Header('Authorization') String authentication,
  ]);

  @Get(path: 'api/getCustomColors')
  Future<Response> getDisplayColors();

  @Get(path: 'api/getProductCategories')
  Future<Response> getProductCategories();

  @Get(path: 'api/getSubCategories')
  Future<Response> getProductSubCategories(@Field('id') int id);

  @Get(path: 'api/getSubSubCategories')
  Future<Response> getProductSubSubCategories(@Field('id') int id);

  @Get(path: 'api/getProductBrand')
  Future<Response> getProductBrands(@Field('brand_id') String brandIds);

  @factoryMethod
  static AppApiService create() {
    final client = ChopperClient(
        baseUrl: BASE_URL,
        services: [_$AppApiService()],
        converter: JsonConverter(),
        client: http.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 60),
        ),
        interceptors: [
          HeadersInterceptor({'Accept': 'application/json'}),
          HttpLoggingInterceptor()
        ]);
    return _$AppApiService(client);
  }
}
