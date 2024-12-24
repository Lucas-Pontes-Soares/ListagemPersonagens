import 'package:flutter/material.dart';

// Desenvolvido por Lucas Pontes Soares 1°DS AMS FATEC

class Motorista extends StatelessWidget {
  var _kmInicio = TextEditingController();
  var _kmFinal = TextEditingController();
  var _litrosGastos = TextEditingController();
  var _valorPassageiros = TextEditingController();
  var _mediaConsumo = TextEditingController();
  var _lucro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '3. Motorista',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                      'Informe os dados para calcular o rendimento de seu carro na praça: '),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: _kmInicio,
                    decoration: InputDecoration(
                        label: Text('Marcação KM no inicio do dia:  ')),
                  ),
                  TextField(
                    controller: _kmFinal,
                    decoration: InputDecoration(
                        label: Text('Marcação KM no final do dia:  ')),
                  ),
                  TextField(
                    controller: _litrosGastos,
                    decoration:
                        InputDecoration(label: Text('Litros gastos:  ')),
                  ),
                  TextField(
                    controller: _valorPassageiros,
                    decoration: InputDecoration(
                        label: Text('Valor recebido dos passageiros:  ')),
                  ),
                  TextField(
                    controller: _mediaConsumo,
                    decoration:
                        InputDecoration(label: Text('Média consumo em Km/L')),
                    readOnly: true,
                  ),
                  TextField(
                    controller: _lucro,
                    decoration: InputDecoration(label: Text('Lucro do dia')),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FilledButton(
                      onPressed: () {
                        var kmInicio = double.tryParse(_kmInicio.text) ?? 0.0;
                        var kmFinal = double.tryParse(_kmFinal.text) ?? 0.0;
                        var litrosGastos =
                            double.tryParse(_litrosGastos.text) ?? 0.0;
                        var valorPassageiros =
                            double.tryParse(_valorPassageiros.text) ?? 0.0;

                        var mediaConsumo = (kmFinal - kmInicio) / litrosGastos;
                        var lucro = valorPassageiros - (2.5 * litrosGastos);

                        _mediaConsumo.text = mediaConsumo.toStringAsFixed(2);
                        _lucro.text = lucro.toStringAsFixed(2);
                      },
                      child: Text('Calcular Rendimento')),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.blue,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Desenvolvido por: Lucas Soares 1 DS FATEC',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
