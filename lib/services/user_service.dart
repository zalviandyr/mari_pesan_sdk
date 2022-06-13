import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mari_pesan_sdk/app/app.dart';
import 'package:mari_pesan_sdk/constants/constants.dart';
import 'package:mari_pesan_sdk/enums/enums.dart';
import 'package:mari_pesan_sdk/models/models.dart';
import 'package:path/path.dart' show extension;

class UserService {
  static final Dio _client = App.instance.client;

  static Future<void> create(User firebaseUser, SignUpUserModel user) async {
    String path = Endpoints.user;
    List<UserProvider> providers = [UserProvider.phone];
    Map<String, dynamic> body = {};

    List<UserInfo> googleInfos = firebaseUser.providerData
        .where((elm) => elm.providerId == 'google.com')
        .toList();

    if (googleInfos.isNotEmpty) {
      UserInfo googleInfo = googleInfos.first;

      body['googleId'] = googleInfo.uid;
      providers.add(UserProvider.google);
    } else {
      providers.add(UserProvider.email);
    }

    body['id'] = firebaseUser.uid;
    body['name'] = user.name;
    body['phone'] = user.phoneNumber;
    body['email'] = user.email;
    body['fcm'] = user.fcm;
    body['provider'] = providers.map((e) => e.value).toList();

    await _client.post(path, data: jsonEncode(body));
  }

  static Future<List<UserModel>> getUsers() async {
    String path = Endpoints.user;

    Response response = await _client.get(path);

    return (response.data['data'] as List)
        .map((e) => UserModel.fromMap(e))
        .toList();
  }

  static Future<bool> checkPhoneNumber(String phone) async {
    String path = Endpoints.userPhone;

    Response response =
        await _client.get(path, queryParameters: {'phones[]': phone});

    return response.data[0];
  }

  static Future<void> update(String uid,
      {String? email, String? name, String? phone}) async {
    String path = '${Endpoints.user}/$uid';

    Map<String, dynamic> body = {};
    if (email != null) body['email'] = email;
    if (phone != null) body['phone'] = phone;
    if (name != null) body['name'] = name;

    if (email != null || phone != null || name != null) {
      await _client.put(path, data: jsonEncode(body));
    }
  }

  static Future<String> updatePhoto(String uid, XFile image) async {
    String path = '${Endpoints.user}/$uid';
    String type = extension(image.path).replaceAll('.', '');

    FormData formData = FormData.fromMap({
      'imageUrl': await MultipartFile.fromFile(
        image.path,
        contentType: MediaType('image', type),
      ),
    });

    Response response = await _client.put(path, data: formData);
    String imageUrl = response.data['data']['imageUrl'];
    return imageUrl;
  }

  static Future<void> logout(String uid) async {
    String path = '${Endpoints.user}/$uid';

    Map<String, dynamic> body = {};
    body['fcm'] = null;

    await _client.put(path, data: jsonEncode(body));
  }
}
