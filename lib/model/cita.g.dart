// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cita _$CitaFromJson(Map<String, dynamic> json) => Cita(
      id: json['id'] as int?,
      medico: json['medico'] == null
          ? null
          : Medico.fromJson(json['medico'] as Map<String, dynamic>),
      paciente: json['paciente'] == null
          ? null
          : User.fromJson(json['paciente'] as Map<String, dynamic>),
      fechaAsignada: json['fechaAsignada'] == null
          ? null
          : DateTime.parse(json['fechaAsignada'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      descripcion: json['descripcion'] as String?,
      motivo: json['motivo'] as String?,
    );

Map<String, dynamic> _$CitaToJson(Cita instance) => <String, dynamic>{
      'id': instance.id,
      'medico': instance.medico,
      'paciente': instance.paciente,
      'fechaAsignada': instance.fechaAsignada?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'descripcion': instance.descripcion,
      'motivo': instance.motivo,
    };
