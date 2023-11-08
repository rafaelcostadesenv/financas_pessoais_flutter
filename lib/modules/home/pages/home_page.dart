import 'package:financas_pessoais_flutter/widgets/my_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contas Pagar/Receber',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Colors.pinkAccent,
                        value: 78.000,
                        showTitle: true,
                        title: 'Despesas',
                        titleStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PieChartSectionData(
                        color: Colors.greenAccent,
                        value: 40.000,
                        showTitle: true,
                        title: 'Receita',
                        titleStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    centerSpaceRadius: 100,
                    sectionsSpace: 5,
                  ),
                ),
              ),
              const Column(
                children: [
                  Text(
                    'Finanças',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    'R\$ 108.000,00',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.greenAccent),
              ),
              const Text(' Receitas  '),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.pinkAccent),
              ),
              const Text(' Despesas'),
            ],
          ),
        ],
      ),
    );
  }
}
