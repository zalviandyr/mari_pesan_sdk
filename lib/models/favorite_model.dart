import 'package:mari_pesan_sdk/models/models.dart';

class FavoriteModel extends RestaurantModel {
  int? favoriteId;

  FavoriteModel({
    required super.id,
    required super.name,
    required super.thumb,
    required super.address,
    required super.description,
    required super.category,
    required this.favoriteId,
  });

  factory FavoriteModel.fromMap(dynamic map) {
    return FavoriteModel(
      id: map['id'],
      name: map['name'] ?? '-',
      thumb: map['thumbnail'],
      address: map['address'] ?? '-',
      description: map['description'] ?? '-',
      category: CategoryModel.fromMap(map['restaurantCategory']),
      favoriteId: map['favouriteId'],
    );
  }

  factory FavoriteModel.copyFromRestaurant(RestaurantModel restaurant) {
    return FavoriteModel(
      id: restaurant.id,
      name: restaurant.name,
      thumb: restaurant.thumb,
      address: restaurant.address,
      description: restaurant.description,
      category: restaurant.category,
      favoriteId: null,
    );
  }
}
