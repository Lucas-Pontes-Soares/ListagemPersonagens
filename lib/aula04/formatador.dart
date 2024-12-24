import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Formatador extends StatelessWidget {
  var _n1 = TextEditingController();
  var _n2 = TextEditingController();
  var _result = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Formatador',
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
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                TextField(
                  controller: _n2,
                  decoration:
                      InputDecoration(label: Text('Digite o segundo valor')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
