import 'package:json_annotation/json_annotation.dart';

import 'package:remind_pills/model/medicamento.dart';

part 'medicamento_compuesto.g.dart';

@JsonSerializable()
class MedicamentoCompuesto {

  Medicamento? medicamentos;
  String? cantidad;
  String? instrucciones;

  MedicamentoCompuesto({
    this.medicamentos,
    this.cantidad,
    this.instrucciones,
  });

  factory MedicamentoCompuesto.fromJson(Map<String, dynamic> json) => _$MedicamentoCompuestoFromJson(json);

  Map<String, dynamic> toJson() => _$MedicamentoCompuestoToJson(this);
}
