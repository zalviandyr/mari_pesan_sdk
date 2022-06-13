import 'package:mari_pesan_sdk/app/app.dart';
import 'package:mari_pesan_sdk/enums/enums.dart';
import 'package:mari_pesan_sdk/models/models.dart';

class CartModel {
  int id;
  final String userId;
  final int restaurantId;
  final OrderProcess orderProcess;
  final OrderType orderType;
  final DateTime? dineTime;
  final String? note;
  final List<CartDetailModel> myDetails;
  final List<CartDetailModel> shareDetails;
  CartShareModel? cartShare;

  CartModel({
    this.id = 0,
    required this.userId,
    required this.restaurantId,
    required this.orderProcess,
    required this.orderType,
    required this.myDetails,
    required this.shareDetails,
    this.dineTime,
    this.note,
    this.cartShare,
  });

  factory CartModel.fromMap(dynamic map) {
    String uid = App.instance.user.value!.uid!;
    List<CartDetailModel> cartDetails = (map['cartDetails'] as List)
        .map((e) => CartDetailModel.fromMap(e))
        .toList();

    // my details menu
    List<CartDetailModel> myDetails =
        cartDetails.where((elm) => elm.userId == uid).toList();

    // share details menu
    List<CartDetailModel> shareDetails =
        cartDetails.where((elm) => elm.userId != uid).toList();

    return CartModel(
      id: map['id'],
      userId: map['userId'],
      restaurantId: map['restaurantId'],
      orderProcess: map['process'] == OrderProcess.now.apiLabel
          ? OrderProcess.now
          : OrderProcess.later,
      orderType: map['type'] == OrderType.dineIn.apiLabel
          ? OrderType.dineIn
          : OrderType.takeAway,
      dineTime:
          map['dineTime'] != null ? DateTime.parse(map['dineTime']) : null,
      note: map['notes'],
      myDetails: myDetails,
      shareDetails: shareDetails,
      cartShare: (map['cartShares'] as List).isEmpty
          ? null
          : CartShareModel.fromMap(map['cartShares'][0]),
    );
  }
}
