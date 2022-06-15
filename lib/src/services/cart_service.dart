import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mari_pesan_sdk/src/app/app.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';
import 'package:mari_pesan_sdk/src/models/models.dart';
import 'package:mari_pesan_sdk/src/services/services.dart';
import 'package:sprintf/sprintf.dart';

class CartService {
  static final Dio _client = App.instance.client;

  static Future<CartModel?> getCart(int? cartId) async {
    String path = cartId == null
        ? Endpoints.myCart
        : sprintf(Endpoints.cartDetail, [cartId]);

    Response? response;
    dynamic data;

    try {
      response = await _client.get(path);

      List listData = response.data['data'];
      data = listData.isNotEmpty ? listData[0] : null;
    } on TypeError {
      data = response?.data['data'];
    } catch (e) {
      log('ERROR', name: 'CartService - getCart', error: e);

      data = null;
    }

    if (data != null) {
      List<UserModel> users = await UserService.getUsers();
      List cartDetails = (data['cartDetails'] as List);

      for (var detail in cartDetails) {
        detail['name'] =
            users.firstWhere((elm) => elm.uid == detail['userId']).name;
      }

      CartModel cart = CartModel.fromMap(data);
      DateTime now = DateTime.now();

      String uid = App.instance.user.value!.uid!;
      // check limit share cart and if not user creator
      if (cart.userId != uid && cart.cartShare != null) {
        if (now.isAfter(cart.cartShare!.activeLimit)) {
          return null;
        }
      }

      return cart;
    }

    return null;
  }

  static Future<List<int>> getCartIds() async {
    String path = Endpoints.myCart;

    Response response = await _client.get(path);
    return (response.data['data'] as List)
        .map((e) => int.parse(e['id'].toString()))
        .toList();
  }

  static Future<void> delete(int id) async {
    String path = sprintf(Endpoints.cartDetail, [id]);

    await _client.delete(path);
  }

  static Future<int> create(String uid, CartModel data) async {
    String path = Endpoints.cart;

    Response response = await _client.post(path, data: {
      'userId': uid,
      'restaurantId': data.restaurantId,
      'type': data.orderType.apiLabel,
      'process': data.orderProcess.apiLabel,
      'dineTime': data.dineTime?.toUtc().toIso8601String(),
      'notes': data.note,
    });

    return response.data['data']['id'];
  }

  static Future<CartShareModel> createShare(
      CartModel cart, CartShareModel cartShare) async {
    String path = sprintf(Endpoints.cartShare, [cart.id]);

    String date = cartShare.activeLimit.toIso8601String();
    String dateZ = date.contains('Z') ? date : '${date}Z';

    Response response = await _client.post(path, data: {
      'activeLimit': dateZ,
      'paymentType': cartShare.paymentType.apiLabel,
    });

    return CartShareModel.fromMap(response.data['data']);
  }

  static Future<int> createMenu(CartDetailModel detail) async {
    String path = sprintf(Endpoints.cartDetailCreate, [detail.cartId]);

    Response response = await _client.post(path, data: {
      'userId': detail.userId,
      'menuId': detail.menuId,
      'quantity': detail.quantity,
    });

    return response.data['data']['id'];
  }

  static Future<void> editMenu(CartDetailModel detail) async {
    String path = sprintf(Endpoints.cartDetailEditDelete, [detail.id]);

    await _client.put(path, data: {
      'userId': detail.userId,
      'menuId': detail.menuId,
      'quantity': detail.quantity,
    });
  }

  static Future<void> deleteMenu(int detailId) async {
    String path = sprintf(Endpoints.cartDetailEditDelete, [detailId]);

    await _client.delete(path);
  }
}
