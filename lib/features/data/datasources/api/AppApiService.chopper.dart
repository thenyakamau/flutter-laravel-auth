// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AppApiService extends AppApiService {
  _$AppApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AppApiService;

  @override
  Future<Response<dynamic>> registerUser(Map<String, dynamic> body) {
    final $url = '/seller/register';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> loginUser(String email, String password) {
    final $url = '/seller/login';
    final $body = <String, dynamic>{'username': email, 'password': password};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> refreshUser(String refreshToken) {
    final $url = '/seller/refresh';
    final $body = <String, dynamic>{'refresh_token': refreshToken};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> splashRefresh(String refreshToken) {
    final $url = '/seller/splashRefresh';
    final $body = <String, dynamic>{'refresh_token': refreshToken};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> getDashBoardData([String authentication]) {
    final $url = '/seller/dashboard';
    final $headers = {'Authorization': authentication};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getDisplayColors() {
    final $url = '/api/getCustomColors';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProductCategories() {
    final $url = '/api/getProductCategories';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProductSubCategories(int id) {
    final $url = '/api/getSubCategories';
    final $body = <String, dynamic>{'id': id};
    final $request = Request('GET', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProductSubSubCategories(int id) {
    final $url = '/api/getSubSubCategories';
    final $body = <String, dynamic>{'id': id};
    final $request = Request('GET', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProductBrands(String brandIds) {
    final $url = '/api/getProductBrand';
    final $body = <String, dynamic>{'brand_id': brandIds};
    final $request = Request('GET', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
