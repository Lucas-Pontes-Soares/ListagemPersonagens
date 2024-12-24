import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Pagamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pagamento Formatter',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(label: Text('Digite a data')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter()
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite a hora')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    HoraInputFormatter()
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite o valor')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter(casasDecimais: 2)
                  ],
                ),
                TextField(
                  decoration:
                      InputDecoration(label: Text('Digite o numero de cartão')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CartaoBancarioInputFormatter()
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                      label: Text('Digite o a validade do cartão')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ValidadeCartaoInputFormatter()
                  ],
                ),
                SizedBox(
                  height: 24,
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
            )),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
