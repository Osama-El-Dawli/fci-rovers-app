import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final num id;
  final String phone;
  final int grade;
  final String sex;
  final String? hobbies;

  UserModel({
    required this.name,
    required this.id,
    required this.phone,
    required this.grade,
    required this.sex,
    this.hobbies,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
