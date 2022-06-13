import 'package:mari_pesan_sdk/src/constants/constants.dart';

class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromMap(dynamic map) {
    return CategoryModel(
      id: map['id'],
      name: map['category'] ?? '-',
      image: map['imageUrl'] ?? AssetImages.noImage,
    );
  }
}
