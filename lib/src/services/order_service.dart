import 'package:dio/dio.dart';
import 'package:mari_pesan_sdk/src/app/app.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';
import 'package:mari_pesan_sdk/src/enums/enums.dart';
import 'package:mari_pesan_sdk/src/models/models.dart';
import 'package:sprintf/sprintf.dart';

class OrderService {
  static final Dio _client = App.instance.client;

  static Future<List<OrderModel>> orders({bool isHistory = false}) async {
    String path = Endpoints.myOrder;

    Response response = await _client.get(path, queryParameters: {
      'status': isHistory ? 'history' : '',
    });

    return (response.data['data'] as List)
        .map((e) => OrderModel.fromMap(e))
        .toList();
  }

  static Future<int> create(String uid, CartModel cart, double total,
      PaymentMethod paymentMethod, PaymentType? paymentType,
      {String? voucherCode, double voucherValue = 0}) async {
    String path = Endpoints.order;

    Response response = await _client.post(path, data: {
      "userId": uid,
      "restaurantId": cart.restaurantId,
      "voucherCode": voucherCode,
      "voucherValue": voucherValue,
      "total": total,
      "type": cart.orderType.apiLabel,
      "notes": cart.note,
      "metadata": {
        "cart_id": cart.id,
        "payment_method": paymentMethod.apiLabel,
        "payment_type": paymentType?.apiLabel,
        "order_time": cart.orderProcess.apiLabel,
      }
    });

    return response.data['data']['id'];
  }

  static Future<void> createDetails(
      String uid, int orderId, int menuId, int quantity) async {
    String path = sprintf(Endpoints.orderDetail, [orderId]);

    await _client.post(
      path,
      data: {
        "userId": uid,
        "menuId": menuId,
        "quantity": quantity,
      },
    );
  }

  static Future<String> createPayment(
      int orderId, double total, PaymentMethod payment) async {
    String path = sprintf(Endpoints.orderPayment, [orderId]);

    String uid = App.instance.user.value!.uid!;
    String phone = App.instance.user.value!.phoneNumber!;

    Response response = await _client.post(path, data: {
      "userId": uid,
      "invoiceId": orderId,
      "total": total,
      "paymentMethod": payment.apiLabel,
      "mobileNumber": phone
    });

    String paymentLink = '';
    var data = response.data['data'];
    if ([PaymentMethod.linkAja, PaymentMethod.dana].contains(payment)) {
      paymentLink = data['metadata']['paymentGateAway']
          ['responsePaymentGateaway']['actions']['mobile_web_checkout_url'];
    }

    if ([PaymentMethod.gopay].contains(payment)) {
      paymentLink = data['metadata']['paymentGateAway']
          ['responsePaymentGateaway']['actions'][1]['url'];
    }

    if ([PaymentMethod.shopeePay].contains(payment)) {
      paymentLink = data['metadata']['paymentGateAway']
              ['responsePaymentGateaway']['actions']
          ['mobile_deeplink_checkout_url'];
    }

    return paymentLink;
  }

  static Future<void> delete(int orderId) async {
    String path = sprintf(Endpoints.orderDelete, [orderId]);

    await _client.delete(path);
  }
}
