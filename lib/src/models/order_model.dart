import 'package:mari_pesan_sdk/src/enums/enums.dart';
import 'package:mari_pesan_sdk/src/models/models.dart';

class OrderModel {
  final int id;
  final int cartId;
  final String userId;
  final int restaurantId;
  final String voucherCode;
  final double voucherValue;
  final PaymentType? paymentType;
  final PaymentMethod paymentMethod;
  final int total;
  final OrderType type;
  final String notes;
  final OrderStatus status;
  final OrderProcess orderTime;
  final DateTime createdAt;
  final List<CartDetailModel> details;
  final RestaurantModel restaurant;

  OrderModel({
    required this.id,
    required this.cartId,
    required this.userId,
    required this.restaurantId,
    required this.voucherCode,
    required this.voucherValue,
    required this.paymentType,
    required this.paymentMethod,
    required this.total,
    required this.type,
    required this.notes,
    required this.status,
    required this.orderTime,
    required this.createdAt,
    required this.details,
    required this.restaurant,
  });

  factory OrderModel.fromMap(dynamic map) {
    return OrderModel(
      id: map['id'],
      cartId: map['metadata']['cart_id'],
      userId: map['userId'],
      restaurantId: map['restaurantId'],
      voucherCode: map['voucherCode'],
      voucherValue: double.parse(map['voucherValue'].toString()),
      paymentMethod:
          PaymentMethod.fromApiLabel(map['metadata']['payment_method']),
      paymentType: map['metadata']['payment_type'] == null
          ? null
          : map['metadata']['payment_type'] == PaymentType.treat.apiLabel
              ? PaymentType.treat
              : PaymentType.individual,
      total: map['total'],
      type: map['type'] == OrderType.dineIn.apiLabel
          ? OrderType.dineIn
          : OrderType.takeAway,
      notes: map['notes'],
      status: OrderStatus.fromApiLabel(map['status']),
      orderTime: map['metadata']['order_time'] == OrderProcess.now.apiLabel
          ? OrderProcess.now
          : OrderProcess.later,
      createdAt: DateTime.parse(map['createdAt']).toLocal(),
      details: (map['orderDetails'] as List)
          .map((e) => CartDetailModel.fromMap(e))
          .toList(),
      restaurant: RestaurantModel.fromMap(map['restaurantData']),
    );
  }
}
