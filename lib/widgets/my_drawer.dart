import 'package:financas_pessoais_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            // decoration: BoxDecoration(color: Colors.greenAccent),
            accountName: Text("Rafael Simão"),
            accountEmail: Text("rafael.costa.desenv@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/Avatar.jpg"),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: const Text(
          //     "Botão",
          //     style: TextStyle(
          //       color: MyColors.textLight,
          //     ),
          //   ),
          // ),
          Card(
            child: ListTile(
              title: const Text('Home'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Contas'),
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.CONTA_PAGE),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Categorias'),
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.CATEGORIA_PAGE),
            ),
          ),
        ],
      ),
    );
  }
}
