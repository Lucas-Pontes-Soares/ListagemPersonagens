import 'package:flutter/material.dart';

// Desenvolvido por Lucas Pontes Soares 1°DS AMS FATEC

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '3. Calculadora IMC',
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
                  Text('Informe os dados para calcular o seu IMC: '),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(label: Text('Informe seu peso')),
                  ),
                  TextField(
                    decoration:
                        InputDecoration(label: Text('Informe sua altura')),
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
