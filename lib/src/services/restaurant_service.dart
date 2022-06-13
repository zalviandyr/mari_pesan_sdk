import 'package:dio/dio.dart';
import 'package:mari_pesan_sdk/src/app/app.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';
import 'package:mari_pesan_sdk/src/models/models.dart';
import 'package:sprintf/sprintf.dart';

class RestaurantService {
  static final Dio _client = App.instance.client;

  static Future<List<RestaurantModel>> restaurants(
      {CategoryModel? category}) async {
    List<RestaurantModel> result = [];
    String path = Endpoints.restaurant;

    if (category != null) {
      Response response = await _client.get(
        path,
        queryParameters: {'category': category.name},
      );

      result = (response.data['data'][0]['restaurants'] as List).map((e) {
        RestaurantModel restaurant = RestaurantModel.fromMap(e);
        restaurant.category = category;

        return restaurant;
      }).toList();
    } else {
      Response response = await _client.get(path);

      result = (response.data['data'] as List)
          .map((e) => RestaurantModel.fromMap(e))
          .toList();
    }

    return result;
  }

  static Future<RestaurantDetailModel> restaurant(int restaurantId) async {
    String path = '${Endpoints.restaurant}/$restaurantId';

    Response response = await _client.get(path);
    return RestaurantDetailModel.fromMap(response.data['data']);
  }

  static Future<List<CategoryModel>> categories() async {
    List<CategoryModel> categories = [];
    String path = Endpoints.categories;

    Response response = await _client.get(path);
    categories = (response.data['data'] as List)
        .map((e) => CategoryModel.fromMap(e))
        .toList();

    return categories;
  }

  static Future<List<MenuCategoryModel>> menus(int restaurantId) async {
    List<MenuCategoryModel> menus = [];
    String path = sprintf(Endpoints.menu, [restaurantId]);

    Response response = await _client.get(path);
    menus = (response.data['data'] as List)
        .map((e) => MenuCategoryModel.fromMap(e))
        .toList();

    return menus;
  }
}
