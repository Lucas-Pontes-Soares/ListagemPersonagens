import 'package:flutter/material.dart';

class Eventos extends StatelessWidget {
  var _n1 = TextEditingController();
  var _n2 = TextEditingController();
  var _result = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Eventos',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                TextField(
                  controller: _n1,
                  decoration:
                      InputDecoration(label: Text('Digite o primeiro valor')),
                ),
                TextField(
                  controller: _n2,
                  decoration:
                      InputDecoration(label: Text('Digite o segundo valor')),
                ),
                TextField(
                  controller: _result,
                  decoration: InputDecoration(label: Text('O resultado é')),
                  readOnly: true,
                ),
                SizedBox(
                  height: 24,
                ),
                FilledButton(
                    onPressed: () {
                      var x = double.tryParse(_n1.text) ?? 0.0;
                      var y = double.tryParse(_n2.text) ?? 0.0;

                      var sum = x + y;
                      _result.text = sum.toStringAsFixed(2);
                    },
                    child: Text('Somar'))
              ],
            )),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
