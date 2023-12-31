import 'package:financas_pessoais_flutter/modules/categoria/controllers/categoria_controller.dart';
import 'package:financas_pessoais_flutter/modules/categoria/pages/categoria_list_page.dart';
import 'package:financas_pessoais_flutter/modules/conta/controllers/conta_controller.dart';
import 'package:financas_pessoais_flutter/modules/conta/pages/conta_list_page.dart';
import 'package:financas_pessoais_flutter/modules/home/pages/home_page.dart';
import 'package:financas_pessoais_flutter/theme/my_theme.dart';
import 'package:financas_pessoais_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoriaController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContaController(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finanças Pessoais',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
      routes: {
        AppRoutes.HOME: (context) => const HomePage(),
        AppRoutes.CONTA_PAGE: (context) => const ContaListPage(),
        AppRoutes.CATEGORIA_PAGE: (context) => CategoriaListPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
