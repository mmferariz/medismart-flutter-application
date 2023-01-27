import 'package:json_annotation/json_annotation.dart';
import 'package:remind_pills/model/medico.dart';
import 'package:remind_pills/model/user.dart';

part 'cita.g.dart';

@JsonSerializable()
class Cita {

  int? id;
  Medico? medico;
  User? paciente;
  DateTime? fechaAsignada;
  DateTime? createdAt;
  String? descripcion;
  String? motivo;
  
  
  Cita({this.id, this.medico, this.paciente, this.fechaAsignada, this.createdAt, this.descripcion, this.motivo});

  factory Cita.fromJson(Map<String, dynamic> json) => _$CitaFromJson(json);

  Map<String, dynamic> toJson() => _$CitaToJson(this);
}