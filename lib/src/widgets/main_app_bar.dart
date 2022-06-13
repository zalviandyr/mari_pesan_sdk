import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mari_pesan_sdk/src/app/app.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final bool canBack;
  final VoidCallback? popCallback;
  final PreferredSizeWidget? bottom;
  final int? navigatorId;

  const MainAppBar({
    Key? key,
    this.title = '',
    this.backgroundColor = Colors.white,
    this.canBack = true,
    this.popCallback,
    this.bottom,
    this.navigatorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: canBack,
      leading: canBack
          ? Navigator.canPop(context)
              ? IconButton(
                  onPressed: () {
                    // reset current
                    Get.routing.current = App.instance.config.navigationRoute;

                    Get.back(id: navigatorId);

                    if (popCallback != null) {
                      popCallback!();
                    }
                  },
                  icon: const Icon(Icons.chevron_left),
                )
              : null
          : null,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
