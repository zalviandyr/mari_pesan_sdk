import 'package:mari_pesan_sdk/models/models.dart';

class MenuCategoryModel {
  final int id;
  final int restaurantId;
  final String category;
  final int number;
  final List<MenuModel> menus;

  MenuCategoryModel({
    required this.id,
    required this.restaurantId,
    required this.category,
    required this.number,
    required this.menus,
  });

  factory MenuCategoryModel.fromMap(dynamic map) {
    return MenuCategoryModel(
      id: map['id'],
      restaurantId: map['restaurantId'],
      category: map['category'],
      number: map['number'],
      menus: map.containsKey('menus')
          ? (map['menus'] as List).map((e) => MenuModel.fromMap(e)).toList()
          : [],
      // menus: Map.,
    );
  }
}
