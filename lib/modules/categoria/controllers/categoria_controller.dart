import 'dart:developer';
import 'package:financas_pessoais_flutter/modules/categoria/models/categoria_model.dart';
import 'package:financas_pessoais_flutter/modules/categoria/repository/categoria_repository.dart';
import 'package:financas_pessoais_flutter/utils/back_routes.dart';
import 'package:flutter/material.dart';

class CategoriaController extends ChangeNotifier {
  List<Categoria> categorias = [];

  Future<List<Categoria>?> findAll() async {
    var categoriaRepository = CategoriaRepository();
    try {
      final response = await categoriaRepository
          .getAll(BackRoutes.baseUrl + BackRoutes.CATEGORIA_ALL);
      if (response != null) {
        List<Categoria> lista =
            response.map<Categoria>((e) => Categoria.fromMap(e)).toList();

        categorias = lista;
        return categorias;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> save(Categoria categoria) async {
    var categoriaRepository = CategoriaRepository();
    try {
      final response = await categoriaRepository.save(
          BackRoutes.baseUrl + BackRoutes.CATEGORIA_SAVE, categoria);
      if (response != null) {
        Categoria categoria =
            Categoria.fromMap(response as Map<String, dynamic>);
        categorias.add(categoria);
      }
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
    var categoriaRepository = CategoriaRepository();
    try {
      final response = await categoriaRepository.delete(
          BackRoutes.baseUrl + BackRoutes.CATEGORIA_DELETE, data);
      if (response != null) {
        categorias.remove(data);
        notifyListeners();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      log(e.toString());
    }
  }

  Future<void> update(Categoria categoria) async {
    var categoriaRepository = CategoriaRepository();
    try {
      final response = await categoriaRepository.update(
          BackRoutes.baseUrl + BackRoutes.CATEGORIA_UPDATE, categoria);
      if (response != null) {
        Categoria categoriaEdit =
            Categoria.fromMap(response as Map<String, dynamic>);
        categorias.add(categoriaEdit);
        categorias.remove(categoria);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
