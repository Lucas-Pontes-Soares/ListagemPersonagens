import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Pessoa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pessoa Formatter',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(label: Text('Digite o nome')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite o CPF')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(14),
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter()
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite a altura')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    AlturaInputFormatter()
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Digite o peso')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    PesoInputFormatter()
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                      label: Text('Digite a data de nascimento')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter()
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
