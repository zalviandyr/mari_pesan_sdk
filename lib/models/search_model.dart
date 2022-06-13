import 'package:mari_pesan_sdk/models/models.dart';

class SearchModel extends MenuModel {
  final RestaurantModel restaurant;

  SearchModel({
    required super.id,
    required super.menuCategoryId,
    required super.name,
    required super.thumb,
    required super.price,
    required super.description,
    required super.stock,
    required super.buffer,
    required this.restaurant,
  });

  factory SearchModel.fromMap(dynamic map) {
    return SearchModel(
      id: map['id'],
      menuCategoryId: map['menuCategoryId'],
      name: map['name'] ?? '-',
      thumb: map['thumbnail'],
      price: map['price'],
      description: map['description'] ?? '-',
      stock: map['stok'],
      buffer: map['buffer'],
      restaurant: RestaurantModel.fromMap(map['menuCategory']['restaurant']),
    );
  }
}
