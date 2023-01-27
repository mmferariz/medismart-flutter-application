// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receta _$RecetaFromJson(Map<String, dynamic> json) => Receta(
      id: json['id'] as int?,
      username: json['username'] as String?,
      medicamentos: (json['medicamentos'] as List<dynamic>?)
          ?.map((e) => MedicamentoCompuesto.fromJson(e as Map<String, dynamic>))
          .toList(),
      medico: json['medico'] == null
          ? null
          : Medico.fromJson(json['medico'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$RecetaToJson(Receta instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'medicamentos': instance.medicamentos,
      'medico': instance.medico,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
