import 'dart:ffi';

import 'package:financas_pessoais_flutter/modules/abstract/models/abstract_entity_model.dart';
import 'package:financas_pessoais_flutter/modules/categoria/models/categoria_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Conta {
  @Id()
  int? id;

  String? createdAt;
  String? updatedAt;
  Categoria? categoria;
  bool? tipo;
  String? data;
  String? descricao;
  double? valor;
  String? destinoOrigem;
  bool? status;

  Conta({
    this.categoria,
    this.tipo,
    this.data,
    this.descricao,
    this.valor,
    this.destinoOrigem,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
}
