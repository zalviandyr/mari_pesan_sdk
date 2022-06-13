import 'package:mari_pesan_sdk/src/models/models.dart';

class CartDetailModel {
  int id;
  final int cartId;
  final String userId;
  final String name;
  final int menuId;
  int quantity;
  final MenuModel menu;

  CartDetailModel({
    this.id = -1,
    required this.cartId,
    required this.userId,
    required this.name,
    required this.menuId,
    required this.quantity,
    required this.menu,
  });

  factory CartDetailModel.fromMap(dynamic map) {
    return CartDetailModel(
      id: map['id'] ?? -1,
      cartId: map['cartId'] ?? -1,
      userId: map['userId'],
      name: map['name'] ?? '-',
      menuId: map['menuId'],
      quantity: map['quantity'],
      menu: MenuModel.fromMap(map['menus']),
    );
  }
}
