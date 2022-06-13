import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mari_pesan_sdk/app/app.dart';
import 'package:mari_pesan_sdk/constants/constants.dart';
import 'package:mari_pesan_sdk/models/models.dart';

class VoucherService {
  static final Dio _client = App.instance.client;

  static Future<VoucherModel?> redeem(String code) async {
    String path = Endpoints.voucher;

    try {
      Response response = await _client.get(
        path,
        queryParameters: {'voucher': code.toUpperCase()},
      );

      return VoucherModel.fromMap(response.data['data']);
    } catch (e) {
      log('ERROR', name: 'VoucherService - redeem', error: e);

      return null;
    }
  }
}
