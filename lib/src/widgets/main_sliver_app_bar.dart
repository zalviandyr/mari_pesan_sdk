import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mari_pesan_sdk/src/app/app.dart';

class MainSliverAppBar extends StatelessWidget {
  final String label;
  final bool canBack;
  final double? expandedHeight;
  final Widget? flexibleSpace;
  final int? navigatorId;

  const MainSliverAppBar({
    Key? key,
    this.label = '',
    this.canBack = true,
    this.expandedHeight,
    this.flexibleSpace,
    this.navigatorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(label),
      leading: canBack
          ? IconButton(
              onPressed: () {
                // reset current
                Get.routing.current = App.instance.config.navigationRoute;

                Get.back(id: navigatorId);
              },
              icon: const Icon(Icons.chevron_left),
            )
          : null,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
    );
  }
}
