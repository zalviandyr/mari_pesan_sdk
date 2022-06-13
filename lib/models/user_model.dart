import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;

  const UserModel({required this.uid, required this.name});

  factory UserModel.fromMap(dynamic map) {
    return UserModel(
      uid: map['id'],
      name: map['name'],
    );
  }

  @override
  List<Object?> get props => [uid, name];
}
