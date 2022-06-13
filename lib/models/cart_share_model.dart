import 'package:mari_pesan_sdk/enums/enums.dart';

class CartShareModel {
  final DateTime activeLimit;
  final PaymentType paymentType;

  CartShareModel({
    required this.activeLimit,
    required this.paymentType,
  });

  factory CartShareModel.fromMap(dynamic map) {
    return CartShareModel(
      activeLimit: DateTime.parse(map['activeLimit']),
      paymentType: map['paymentType'] == PaymentType.treat.apiLabel
          ? PaymentType.treat
          : PaymentType.individual,
    );
  }
}
