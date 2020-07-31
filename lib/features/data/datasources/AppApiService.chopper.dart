// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AppApiService extends AppApiService {
  _$AppApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AppApiService;

  Future<Response> registerUser(Map<String, dynamic> body) {
    final $url = '/api/register';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
