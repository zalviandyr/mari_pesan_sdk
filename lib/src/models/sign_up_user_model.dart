class SignUpUserModel {
  static SignUpUserModel? _user;

  SignUpUserModel._();

  static SignUpUserModel get instance => _user ??= SignUpUserModel._();

  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? fcm;
  String? verificationId;
  String? verificationCode;
}
