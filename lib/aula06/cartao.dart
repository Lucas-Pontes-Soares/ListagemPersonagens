import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cartao extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Cartao();
  }
}

class _Cartao extends State<Cartao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cartão'),
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(50),
              child: Column(children: [
                Text('Faculdade de Tecnoloia de Ourinhos'),
                Text('AMS'),
                Text('Programação Mobile')
              ]),
            );
          },
        ));
  }
}
