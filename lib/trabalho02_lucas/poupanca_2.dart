import 'package:flutter/material.dart';

// Desenvolvido por Lucas Pontes Soares 1°DS AMS FATEC

class Poupanca extends StatelessWidget {
  var _deposito = TextEditingController();
  var _resultado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '2. Poupança',
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
                  Text('Informe o deposito para calcular o rendimento: '),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: _deposito,
                    decoration:
                        InputDecoration(label: Text('Valor do depósito: ')),
                  ),
                  TextField(
                    controller: _resultado,
                    decoration:
                        InputDecoration(label: Text('Resutado, rendimento')),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FilledButton(
                      onPressed: () {
                        var deposito = double.tryParse(_deposito.text) ?? 0.0;
                        var rendimento = deposito + (deposito * 0.05);
                        _resultado.text = rendimento.toStringAsFixed(2);
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
