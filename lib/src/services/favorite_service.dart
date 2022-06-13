import 'package:dio/dio.dart';
import 'package:mari_pesan_sdk/src/app/app.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';
import 'package:mari_pesan_sdk/src/models/models.dart';
import 'package:sprintf/sprintf.dart';

class FavoriteService {
  static final Dio _client = App.instance.client;

  static Future<List<FavoriteModel>> favorites(String uid) async {
    String path = sprintf(Endpoints.favorites, [uid]);

    Response response = await _client.get(path);

    return (response.data['data'] as List)
        .map((e) => FavoriteModel.fromMap(e))
        .toList();
  }

  static Future<int> add(String uid, RestaurantModel restaurant) async {
    String path = sprintf(Endpoints.favorites, [uid]);

    Response response = await _client.post(
      path,
      data: {'restaurantId': restaurant.id},
    );

    return response.data['data']['id'];
  }

  static Future<void> remove(String uid, FavoriteModel favorite) async {
    String path = sprintf(Endpoints.favoritesDelete, [favorite.favoriteId]);

    await _client.delete(path);
  }
}
