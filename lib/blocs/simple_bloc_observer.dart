import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mari_pesan_sdk/errors/errors.dart';
import 'package:mari_pesan_sdk/widgets/widgets.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (error is FirebaseAuthException) {
      String code = error.code;
      _handleSnackbar(code: code);
    } else if (error is DioError) {
      String? message = error.response?.data['message'];
      _handleSnackbar(message: message);
    } else if (error is AppError) {
      if (error.isToast) {
        _handleToast(error.message);
      } else {
        _handleSnackbar(message: error.message);
      }
    } else {
      _handleSnackbar();
    }

    if (kDebugMode) {
      log(
        '----------------------- Error -----------------------',
        error: error,
        stackTrace: stackTrace,
      );
    } else {
      if (error is! AppError) {
        // report error
        FirebaseCrashlytics.instance
            .recordError(error, stackTrace, fatal: true);
      }
    }

    super.onError(bloc, error, stackTrace);
  }

  void _handleSnackbar({String? code, String? message}) {
    if (code == 'user-not-found') {
      showSnackbar('Oops.. User not found', isError: true);
    } else if (code == 'wrong-password') {
      showSnackbar('Oops.. Wrong password', isError: true);
    } else if (code == 'email-already-in-use') {
      showSnackbar('Oops.. Email already in use', isError: true);
    } else if (code == 'phone-already-in-use') {
      showSnackbar('Oops.. Phone number already in use', isError: true);
    } else if (code == 'too-many-requests') {
      showSnackbar('Oops.. Too many requests', isError: true);
    } else if (code == 'invalid-verification-code') {
      showSnackbar('Oops.. Invalid verification code', isError: true);
    } else if (code == 'missing-client-identifier') {
      showSnackbar('Oops.. Missing client identifier', isError: true);
    } else if (code == 'google-cant-reset-password') {
      showSnackbar('Oops.. Sign in with Google cant reset password',
          isError: true);
    } else if (code == 'expired-action-code') {
      showSnackbar('Oops.. Code expired', isError: true);
    } else if (code == 'invalid-action-code') {
      showSnackbar('Oops.. Code Invalid', isError: true);
    } else {
      if (message != null) {
        showSnackbar(message, isError: true);
      } else {
        showSnackbar('Something wrong', isError: true);
      }
    }
  }

  void _handleToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
