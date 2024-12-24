import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

class FormatadorMoeda extends StatelessWidget {
  var _n1 = TextEditingController();
  var _n2 = TextEditingController();
  var _result = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'FormatadorMoeda',
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
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter(casasDecimais: 2)
                  ],
                ),
                TextField(
                  controller: _n2,
                  decoration:
                      InputDecoration(label: Text('Digite o segundo valor')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter(casasDecimais: 2)
                  ],
                ),
                TextField(
                  controller: _result,
                  decoration: InputDecoration(label: Text('O resultado é')),
                  readOnly: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter(casasDecimais: 2)
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                FilledButton(
                    onPressed: () {
                      var x =
                          UtilBrasilFields.converterMoedaParaDouble(_n1.text);
                      var y =
                          UtilBrasilFields.converterMoedaParaDouble(_n2.text);

                      var sum = x + y;
                      _result.text =
                          UtilBrasilFields.obterReal(sum, moeda: false);
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
