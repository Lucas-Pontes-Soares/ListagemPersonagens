import 'package:flutter/material.dart';

// Desenvolvido por Lucas Pontes Soares 1°DS AMS FATEC

class CalculadoraCombustivel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '2. Calculadora Combustivel',
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
                      'Informe os dados para calcular qual combustível compensa mais:'),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(label: Text('Quantidade de litros')),
                  ),
                  TextField(
                    decoration: InputDecoration(label: Text('Preço do alcool')),
                  ),
                  TextField(
                    decoration:
                        InputDecoration(label: Text('Preço da gasolina')),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FilledButton(onPressed: () => {}, child: Text('Calcular')),
                  TextField(
                    decoration: InputDecoration(label: Text('Resultado: ')),
                    readOnly: true,
                  ),
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
