import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;

part 'AppApiService.chopper.dart';

@ChopperApi(baseUrl: '/seller/')
abstract class AppApiService extends ChopperService {
  @Post(path: 'register')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> registerUser(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'login')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> loginUser(
    @Field('username') String email,
    @Field() String password,
  );

  @Post(path: 'refresh')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> refreshUser(@Field('refresh_token') String refreshToken);

  static AppApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://3165c8846fa7.ngrok.io',
        services: [_$AppApiService()],
        converter: JsonConverter(),
        client: http.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 60),
        ),
        interceptors: [
          HeadersInterceptor({'Cache-Control': 'no-cache'}),
          HttpLoggingInterceptor()
        ]);
    return _$AppApiService(client);
  }
}
