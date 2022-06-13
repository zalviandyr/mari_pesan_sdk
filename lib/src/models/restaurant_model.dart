import 'package:mari_pesan_sdk/src/models/models.dart';

class RestaurantModel {
  final int id;
  final String name;
  final String thumb;
  final String address;
  final String description;
  CategoryModel? category; // can be reassign

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumb,
    required this.address,
    required this.description,
    required this.category,
  });

  factory RestaurantModel.fromMap(dynamic map) {
    return RestaurantModel(
      id: map['id'] ?? -1,
      name: map['name'] ?? '-',
      thumb: map['thumbnail'],
      address: map['address'] ?? '-',
      description: map['description'] ?? '-',
      category: map.containsKey('restaurantCategory')
          ? CategoryModel.fromMap(map['restaurantCategory'])
          : null,
    );
  }
}
