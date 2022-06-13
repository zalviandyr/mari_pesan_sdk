import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/route_manager.dart';
import 'package:mari_pesan_sdk/config.dart';

part 'api.dart';
part 'auth_user.dart';
part 'flutter_notification.dart';
part 'local_storage.dart';

class App {
  static App? _app;
  final ValueNotifier<AuthUser?> user = ValueNotifier(null);

  App._();

  static App get instance => _app ??= App._();

  final LocalStorage storage = LocalStorage._instance;
  final FlutterNotification notification = FlutterNotification._instance;
  final Api _api = Api._instance;
  late Dio client;
  late String _signInRoute;
  late String navigationRoute;

  Future<void> init(Config config) async {
    // notification
    await notification._init(config);

    // api client
    client = _api._init(config);

    // local storage
    storage._init();

    // sign in route
    _signInRoute = config.signInRoute;

    // navigation route
    navigationRoute = config.navigationRoute;
  }

  void login(User user) {
    this.user.value ??= AuthUser._();
    this.user.value!._login(user);
  }

  bool isAuthenticated() {
    bool result = true;
    AuthUser? user = App.instance.user.value;

    if (user == null) {
      result = false;
      Get.toNamed(_signInRoute);
    }

    return result;
  }

  bool isGoogleUser() {
    User user = FirebaseAuth.instance.currentUser!;

    try {
      user.providerData.firstWhere(
        (element) => element.providerId == 'google.com',
      );

      return true;
    } catch (_) {
      return false;
    }
  }
}
