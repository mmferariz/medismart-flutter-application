// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      nombre: json['nombre'] as String?,
      apellidos: json['apellidos'] as String?,
      telefono: json['telefono'] as String?,
      gender: json['gender'] as String?,
      fechaNacimiento: json['fechaNacimiento'] == null
          ? null
          : DateTime.parse(json['fechaNacimiento'] as String),
    )
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..recetas = (json['recetas'] as List<dynamic>?)
          ?.map((e) => Receta.fromJson(e as Map<String, dynamic>))
          .toList()
      ..citas = (json['citas'] as List<dynamic>?)
          ?.map((e) => Cita.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['username'] = instance.username;
  val['email'] = instance.email;
  val['password'] = instance.password;
  val['nombre'] = instance.nombre;
  val['apellidos'] = instance.apellidos;
  val['telefono'] = instance.telefono;
  val['gender'] = instance.gender;
  val['fechaNacimiento'] = instance.fechaNacimiento?.toIso8601String();
  val['createdAt'] = instance.createdAt?.toIso8601String();
  val['recetas'] = instance.recetas;
  val['citas'] = instance.citas;
  return val;
}
