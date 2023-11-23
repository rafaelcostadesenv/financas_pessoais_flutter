import 'package:financas_pessoais_flutter/modules/abstract/models/abstract_entity_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Categoria {
  @Id()
  int? id;

  String? createdAt;
  String? updatedAt;
  String? nome;

  Categoria({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.nome,
  });
}
