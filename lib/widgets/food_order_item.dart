import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mari_pesan_sdk/constants/constants.dart';
import 'package:mari_pesan_sdk/models/models.dart';
import 'package:mari_pesan_sdk/utils/utils.dart';

class CartItem extends StatelessWidget {
  final CartDetailModel detail;

  const CartItem({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Metrics.verticalInsetPadding,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: detail.menu.thumb,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
              errorWidget: (context, url, child) {
                return Image.asset(
                  AssetImages.noImage2,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Metrics.horizontalDenseSizedBox,
          SizedBox(
            width: 130,
            child: Text(
              detail.menu.name,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Text(
            '${detail.quantity}X',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          SizedBox(
            width: 110,
            child: Text(
              Formatter.toRupiah(detail.menu.price),
              style: const TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
