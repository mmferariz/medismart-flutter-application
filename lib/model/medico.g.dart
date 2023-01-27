// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medico.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medico _$MedicoFromJson(Map<String, dynamic> json) => Medico(
      id: json['id'] as int?,
      nombre: json['nombre'] as String?,
      apellidos: json['apellidos'] as String?,
      especialidad: json['especialidad'] as String?,
      cedula: json['cedula'] as String?,
      username: json['username'] as String?,
      telefono: json['telefono'] as String?,
      recetas: (json['recetas'] as List<dynamic>?)
          ?.map((e) => Receta.fromJson(e as Map<String, dynamic>))
          .toList(),
      citas: (json['citas'] as List<dynamic>?)
          ?.map((e) => Cita.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MedicoToJson(Medico instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'apellidos': instance.apellidos,
      'especialidad': instance.especialidad,
      'cedula': instance.cedula,
      'username': instance.username,
      'telefono': instance.telefono,
      'recetas': instance.recetas,
      'citas': instance.citas,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
