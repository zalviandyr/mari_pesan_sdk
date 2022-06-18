import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mari_pesan_sdk/config.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';

part 'api.dart';
part 'auth_user.dart';
part 'flutter_notification.dart';
part 'local_storage.dart';

class App {
  static App? _app;
  final ValueNotifier<AuthUser?> user = ValueNotifier(null);

  App._();

  static App get instance => _app ??= App._();

  ThemeData get themeData => _themeData();

  final LocalStorage storage = LocalStorage._instance;
  final FlutterNotification notification = FlutterNotification._instance;
  final Api _api = Api._instance;
  late Dio client;
  late Config config;

  Future<void> init(Config config) async {
    // notification
    await notification._init(config);

    // api client
    client = _api._init(config);

    // local storage
    storage._init();

    // app config
    this.config = config;
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
      Get.toNamed(config.signInRoute);
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

  ThemeData _themeData() {
    return ThemeData(
      primaryColor: Pallette.primary,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Pallette.primary,
        secondary: Pallette.primary,
      ),
      textTheme: GoogleFonts.interTextTheme(
        const TextTheme(
          headline5: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Pallette.textPrimary,
          ),
          headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Pallette.textPrimary,
          ),
          // TextFormField text style
          subtitle1: TextStyle(
            fontWeight: FontWeight.w500,
            color: Pallette.textPrimary,
          ),
          // Default text style on widget Text
          bodyText2: TextStyle(
            fontWeight: FontWeight.w500,
            color: Pallette.textPrimary,
          ),
          caption: TextStyle(
            fontWeight: FontWeight.w500,
            color: Pallette.textPrimary,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Pallette.primary,
          size: 30,
        ),
        titleTextStyle: GoogleFonts.inter(
          color: Pallette.primary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
