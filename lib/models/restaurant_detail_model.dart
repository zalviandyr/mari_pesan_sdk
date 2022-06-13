import 'package:mari_pesan_sdk/models/models.dart';

class RestaurantDetailModel {
  final int id;
  final String name;
  final String thumb;
  final String address;
  final String description;
  final int balance;
  final bool active;
  final List<MenuCategoryModel> menuCategories;
  final List<RestaurantSchedule> schedules;

  RestaurantDetailModel({
    required this.id,
    required this.name,
    required this.thumb,
    required this.address,
    required this.description,
    required this.balance,
    required this.active,
    required this.menuCategories,
    required this.schedules,
  });

  factory RestaurantDetailModel.fromMap(dynamic map) {
    return RestaurantDetailModel(
      id: map['id'],
      name: map['name'] ?? '-',
      thumb: map['thumbnail'],
      address: map['address'] ?? '-',
      description: map['description'] ?? '-',
      balance: map['balance'],
      active: map['active'],
      menuCategories: (map['menuCategories'] as List)
          .map((e) => MenuCategoryModel.fromMap(e))
          .toList(),
      schedules: (map['schedules'] as List)
          .map((e) => RestaurantSchedule.fromMap(e))
          .toList(),
    );
  }
}
