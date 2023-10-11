import 'package:financas_pessoais_flutter/modules/categoria/controllers/categoria_controller.dart';
import 'package:financas_pessoais_flutter/modules/categoria/models/categoria_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriaListPage extends StatelessWidget {
  CategoriaListPage({super.key});

  // Future<List<Categoria>?> findAll() async {
  //   var categoriaRepository = CategoriaRepository();
  //   try {
  //     final response = await categoriaRepository
  //         .getAll(BackRoutes.baseUrl + BackRoutes.CATEGORIA_ALL);
  //     if (response != null) {
  //       List<Categoria> categorias =
  //           response.map<Categoria>((e) => Categoria.fromMap(e)).toList();
  //       return categorias;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  save() {}

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CategoriaController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Consumer<CategoriaController>(
        builder: (context, controller, child) => FutureBuilder(
          future: controller.findAll(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Categoria> data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (ctx, index) => Card(
                    child: ListTile(
                      title: Text(data[index].nome),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text("Erro ao buscar categorias..."),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.create(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
