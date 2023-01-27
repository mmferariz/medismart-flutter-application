import 'package:json_annotation/json_annotation.dart';

import 'package:remind_pills/model/receta.dart';

import 'cita.dart';

part 'medico.g.dart';

@JsonSerializable()
class Medico {

  int? id;
  String? nombre;
  String? apellidos;
  String? especialidad;
  String? cedula;
  String? username;
  String? telefono;
  List<Receta>? recetas;
  List<Cita>? citas;
  DateTime? createdAt;
  
  Medico({
    this.id,
    this.nombre,
    this.apellidos,
    this.especialidad,
    this.cedula,
    this.username,
    this.telefono,
    this.recetas,
    this.citas,
    this.createdAt,
  });
  
  
  factory Medico.fromJson(Map<String, dynamic> json) => _$MedicoFromJson(json);

  Map<String, dynamic> toJson() => _$MedicoToJson(this);
}
