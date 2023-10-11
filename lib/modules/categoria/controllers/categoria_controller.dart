import 'dart:developer';
import 'package:financas_pessoais_flutter/modules/categoria/models/categoria_model.dart';
import 'package:financas_pessoais_flutter/modules/categoria/repository/categoria_repository.dart';
import 'package:financas_pessoais_flutter/utils/back_routes.dart';
import 'package:flutter/material.dart';

class CategoriaController extends ChangeNotifier {
  // var categorias = [
  //   Categoria(
  //     nome: "FARMACIA",
  //   ),
  //   Categoria(
  //     nome: "MERCADO",
  //   ),
  // ];

  // Future<List<Categoria>> findAll() async {
  //   return Future.delayed(const Duration(seconds: 1), () => categorias);
  // }

  Future<List<Categoria>?> findAll() async {
    var categoriaRepository = CategoriaRepository();
    try {
      final response = await categoriaRepository
          .getAll(BackRoutes.baseUrl + BackRoutes.CATEGORIA_ALL);
      if (response != null) {
        List<Categoria> categorias =
            response.map<Categoria>((e) => Categoria.fromMap(e)).toList();
        return categorias;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  create(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nomeController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nova Categoria'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  var categoria = Categoria(nome: _nomeController.text);
                  // categorias.add(categoria);
                  Navigator.of(context).pop();
                  notifyListeners();
                }
              },
              icon: Icon(Icons.save),
              label: Text('Salvar'))
        ],
      ),
    );
  }
}
