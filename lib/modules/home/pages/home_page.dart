import 'package:brasil_fields/brasil_fields.dart';
import 'package:financas_pessoais_flutter/modules/conta/controllers/conta_controller.dart';
import 'package:financas_pessoais_flutter/modules/home/models/resumo_DTO.dart';
import 'package:financas_pessoais_flutter/widgets/my_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Resumo'),
      ),
      body: FutureBuilder<ResumoDTO?>(
          future: context.read<ContaController>().resumo(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                ResumoDTO data = snapshot.data!;
                return Column(
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
                                  value: data.totalDespesa,
                                  showTitle: true,
                                  title: 'Despesas',
                                  titleStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                PieChartSectionData(
                                  color: Colors.greenAccent,
                                  value: data.totalReceita,
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
                        Column(
                          children: [
                            // Text(
                            //   'Saldo',
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //     color: Colors.teal,
                            //   ),
                            // ),
                            Text(
                              UtilBrasilFields.obterReal(data.saldo),
                              style: const TextStyle(
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
                        const Text(' Receitas '),
                        Text(UtilBrasilFields.obterReal(data.totalReceita)),
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
                        const Text(' Despesas '),
                        Text(UtilBrasilFields.obterReal(data.totalDespesa)),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Erro ao buscar dados'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
