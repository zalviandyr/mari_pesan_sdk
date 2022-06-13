import 'package:dio/dio.dart';
import 'package:mari_pesan_sdk/src/app/app.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';
import 'package:mari_pesan_sdk/src/models/models.dart';

class SearchService {
  static final Dio _client = App.instance.client;

  static Future<List<SearchModel>> search(String keyword) async {
    String path = Endpoints.restaurant;

    Response response = await _client.get(
      path,
      queryParameters: {'name': keyword},
    );

    return (response.data['data'] as List)
        .map((e) => SearchModel.fromMap(e))
        .toList();
  }
}
