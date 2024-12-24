import 'package:flutter/material.dart';

class Componentes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Componentes',
          ),
        ),
        body: Column(
          children: [
            TextField(
              decoration:
                  InputDecoration(label: Text('Digite o primeiro valor')),
            ),
            TextField(
              decoration:
                  InputDecoration(label: Text('Digite o segundo valor')),
            ),
            TextField(
              decoration: InputDecoration(label: Text('O resultado é')),
              readOnly: true,
            ),
            FilledButton(onPressed: () => {}, child: Text('Somar'))
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
