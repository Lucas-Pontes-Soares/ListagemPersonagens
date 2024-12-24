import 'package:flutter/material.dart';

// Desenvolvido por Lucas Pontes Soares 1°DS AMS FATEC

class Medidas extends StatelessWidget {
  var _metros = TextEditingController();
  var _centimetros = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '1. Medidas',
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
                      'Informe uma medida em metros para converter para centrimetros: '),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: _metros,
                    decoration:
                        InputDecoration(label: Text('Medida em Metros')),
                  ),
                  TextField(
                    controller: _centimetros,
                    decoration:
                        InputDecoration(label: Text('Resutado (em cm)')),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FilledButton(
                      onPressed: () {
                        var metros = double.tryParse(_metros.text) ?? 0.0;

                        var centimetros = metros * 100;
                        _centimetros.text = centimetros.toStringAsFixed(2);
                      },
                      child: Text('Calcular')),
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
