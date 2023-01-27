import 'package:json_annotation/json_annotation.dart';

import 'package:remind_pills/model/medicamento_compuesto.dart';

import 'medico.dart';

part 'receta.g.dart';

@JsonSerializable()
class Receta {

  int? id;
  String? username;
  MedicamentoCompuesto? medicamentos;
  Medico? medico;
  DateTime? createdAt;
  
  Receta({
    this.id,
    this.username,
    this.medicamentos,
    this.medico,
    this.createdAt,
  });

  factory Receta.fromJson(Map<String, dynamic> json) => _$RecetaFromJson(json);

  Map<String, dynamic> toJson() => _$RecetaToJson(this);
}
