import 'package:mari_pesan_sdk/src/enums/enums.dart';

class VoucherModel {
  final int id;
  final int restaurantId;
  final String name;
  final String code;
  final VoucherType type;
  final double value;
  final int minTransaction;
  final int maxReduction;
  final int quota;
  final DateTime expired;

  VoucherModel({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.code,
    required this.type,
    required this.value,
    required this.minTransaction,
    required this.maxReduction,
    required this.quota,
    required this.expired,
  });

  factory VoucherModel.fromMap(dynamic map) {
    return VoucherModel(
      id: map['id'],
      restaurantId: map['restaurantId'],
      name: map['name'],
      code: map['code'],
      type: map['type'] == VoucherType.percent.apiLabel
          ? VoucherType.percent
          : VoucherType.amount,
      value: double.parse(map['value'].toString()),
      minTransaction: map['minTransaction'],
      maxReduction: map['maxReduction'],
      quota: map['quota'],
      expired: DateTime.parse(map['expired']),
    );
  }
}
