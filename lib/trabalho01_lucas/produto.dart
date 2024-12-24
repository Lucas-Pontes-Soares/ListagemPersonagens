import 'package:flutter/material.dart';

// Desenvolvido por Lucas Pontes Soares 1°DS AMS FATEC

class Produto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '1. Produto',
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
                  Text('Informe os dados para cadastrar um produto:'),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    decoration: InputDecoration(label: Text('Código')),
                  ),
                  TextField(
                    decoration: InputDecoration(label: Text('Nome')),
                  ),
                  TextField(
                    decoration: InputDecoration(label: Text('Preço')),
                    readOnly: true,
                  ),
                  TextField(
                    decoration: InputDecoration(label: Text('Quantidade')),
                    readOnly: true,
                  ),
                  TextField(
                    decoration: InputDecoration(label: Text('Validade')),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FilledButton(onPressed: () => {}, child: Text('Adicionar')),
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
