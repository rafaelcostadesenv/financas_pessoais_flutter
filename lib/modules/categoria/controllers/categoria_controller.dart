import 'dart:developer';
import 'package:financas_pessoais_flutter/database/objectbox.g.dart';
import 'package:financas_pessoais_flutter/database/objectbox_database.dart';
import 'package:financas_pessoais_flutter/modules/categoria/models/categoria_model.dart';
import 'package:financas_pessoais_flutter/modules/categoria/repository/categoria_repository.dart';
import 'package:financas_pessoais_flutter/utils/back_routes.dart';
import 'package:flutter/material.dart';

class CategoriaController extends ChangeNotifier {
  List<Categoria> categorias = [];

  Future<Box<Categoria>> getBox() async {
    final store = await ObjectBoxDataBase.getStore();

    return store.box<Categoria>();
  }

  Future<List<Categoria>?> findAll() async {
    try {
      final box = await getBox();
      categorias = box.getAll();

      return categorias;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> save(Categoria categoria) async {
    try {
      final box = await getBox();
      box.put(categoria);
      categorias.add(categoria);
    } catch (e) {
      log(e.toString());
    }
  }

  create(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nomeController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nova Categoria'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton.icon(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  var categoria = Categoria(nome: nomeController.text);
                  await save(categoria);
                  Navigator.of(context).pop();
                  notifyListeners();
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Salvar'))
        ],
      ),
    );
  }

  edit(BuildContext context, Categoria data) {
    final formKey = GlobalKey<FormState>();
    final nomeController = TextEditingController(text: data.nome);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Editar Categoria'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton.icon(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  data.nome = nomeController.text;
                  await update(data);
                  Navigator.of(context).pop();
                  notifyListeners();
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Salvar'))
        ],
      ),
    );
  }

  delete(BuildContext context, Categoria data) async {
    try {
      final box = await getBox();
      box.remove(data.id!);
      categorias.remove(data);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> update(Categoria categoria) async {
    try {
      final box = await getBox();
      box.put(categoria);
      categorias.add(categoria);
    } catch (e) {
      log(e.toString());
    }
  }
}
