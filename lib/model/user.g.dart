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

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'nombre': instance.nombre,
      'apellidos': instance.apellidos,
      'telefono': instance.telefono,
      'gender': instance.gender,
      'fechaNacimiento': instance.fechaNacimiento?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'recetas': instance.recetas,
      'citas': instance.citas,
    };
