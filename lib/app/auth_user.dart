part of 'app.dart';

class AuthUser {
  AuthUser._();

  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? fcm;
  String? imageUrl;
  DateTime? birthDate;
  DateTime? createdAt;

  void _login(User user) {
    uid = user.uid;
    name = user.displayName;
    email = user.email;
    phoneNumber = user.phoneNumber;
    imageUrl = user.photoURL;
    createdAt = user.metadata.creationTime;
  }
}
