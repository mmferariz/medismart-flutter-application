//662fbf47f38b70e800b952b085628cbc1d20af03234b7207b9e702d857e599e1afcc153275c20387328169fe7832be97c8c6d4df18b2edc200a356726b4d0c9776171dfcf803988bb352809c1a328e516d06a6a434fb15ae24b56315016c58e354c818212f83696c2e96654519d30acb103eba6df368d27577c83a415dd1f997

//flutter pub run build_runner build --delete-conflicting-outputs
//flutter pub run build_runner watch --delete-conflicting-outputs

import 'package:json_annotation/json_annotation.dart';
import 'package:remind_pills/model/cita.dart';
import 'package:remind_pills/model/receta.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  @JsonKey(includeIfNull: false)
  int? id;
  String? username;
  String? email;
  String? password;
  String? nombre;
  String? apellidos;
  String? telefono;
  String? gender;
  DateTime? fechaNacimiento;
  @JsonKey(includeToJson: false)
  DateTime? createdAt;
  List<Receta>? recetas;
  List<Cita>? citas;
  
  
  User({this.id, this.username, this.email, this.password, this.nombre, this.apellidos, this.telefono, this.gender, this.fechaNacimiento});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}