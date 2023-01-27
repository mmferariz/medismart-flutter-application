// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamento_compuesto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicamentoCompuesto _$MedicamentoCompuestoFromJson(
        Map<String, dynamic> json) =>
    MedicamentoCompuesto(
      medicamentos: json['medicamentos'] == null
          ? null
          : Medicamento.fromJson(json['medicamentos'] as Map<String, dynamic>),
      cantidad: json['cantidad'] as String?,
      instrucciones: json['instrucciones'] as String?,
    );

Map<String, dynamic> _$MedicamentoCompuestoToJson(
        MedicamentoCompuesto instance) =>
    <String, dynamic>{
      'medicamentos': instance.medicamentos,
      'cantidad': instance.cantidad,
      'instrucciones': instance.instrucciones,
    };
