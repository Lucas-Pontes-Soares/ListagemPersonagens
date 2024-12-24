import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Empresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Empresa Formatter',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(label: Text('Digite o CPNJ')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CnpjInputFormatter()
                  ],
                ),
                TextField(
                  decoration:
                      InputDecoration(label: Text('Digite a razão social')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite a rua')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite o número')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite o bairro')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite a cidade')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite o CEP')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter()
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite o telefone')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite o email')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z0-9._%+-@]'),
                    ),
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
