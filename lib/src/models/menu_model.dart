class MenuModel {
  final int id;
  final int menuCategoryId;
  final String name;
  final String thumb;
  final int price;
  final String description;
  final int stock;
  final int buffer;

  MenuModel({
    required this.id,
    required this.menuCategoryId,
    required this.name,
    required this.thumb,
    required this.price,
    required this.description,
    required this.stock,
    required this.buffer,
  });

  factory MenuModel.fromMap(dynamic map) {
    return MenuModel(
      id: map['id'] ?? -1,
      menuCategoryId: map['menuCategoryId'] ?? -1,
      name: map['name'] ?? '-',
      thumb: map['thumbnail'],
      price: map['price'],
      description: map['description'] ?? '-',
      stock: map['stok'] ?? 0,
      buffer: map['buffer'] ?? 0,
    );
  }
}
