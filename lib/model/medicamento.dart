import 'package:json_annotation/json_annotation.dart';

part 'medicamento.g.dart';

@JsonSerializable()
class Medicamento {

  int? id;
  String? nombre;
  DateTime? createdAt;
  
  
  Medicamento({this.id, this.nombre, this.createdAt});

  factory Medicamento.fromJson(Map<String, dynamic> json) => _$MedicamentoFromJson(json);

  Map<String, dynamic> toJson() => _$MedicamentoToJson(this);
}