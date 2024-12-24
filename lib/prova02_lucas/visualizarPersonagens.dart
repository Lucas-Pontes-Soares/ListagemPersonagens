import 'package:aula/prova02_lucas/adicionarPersonagem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Prova 02 - Lucas Pontes Soares 1 ADS

class VisualizarPersonagens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VisualizarPersonagens();
  }
}

class _VisualizarPersonagens extends State<VisualizarPersonagens> {
  var dio = Dio();
  var personagens = [];

  final TextEditingController _idFilter = TextEditingController();

  void filtrarPorId() async {
    try {
      if (_idFilter.text != "") {
        var resposta = await dio.get(
            'https://673cc3bb96b8dcd5f3fb8731.mockapi.io/characters/${_idFilter.text}');

        if (resposta.statusCode == 200) {
          personagens = [resposta.data];
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Personagem não encontrado')),
          );
        }
      } else {
        listar();
      }
    } catch (e) {
      print('Erro durante a requisição: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Personagem não encontrado')),
      );
    }
  }

  void listar() async {
    try {
      var resposta = await dio
          .get("https://673cc3bb96b8dcd5f3fb8731.mockapi.io/characters");
      personagens = resposta.data;
      setState(() {});
    } catch (e) {
      print('Erro durante a requisição: $e');
    }
  }

  @override
  void initState() {
    listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualização dos personagens'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adicionar novo personagem:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdicionarPersonagem()),
                    );
                  },
                  child: Text('Clique aqui'),
                ),
                TextField(
                  controller: _idFilter,
                  decoration: InputDecoration(label: Text('Busque por um id')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                FilledButton(onPressed: filtrarPorId, child: Text('Filtrar')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: personagens.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Código: ${personagens[index]['id']}'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('${personagens[index]['name']}'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network('${personagens[index]['avatar']}'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('${personagens[index]['description']}'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Text('Universo: ${personagens[index]['universe']}'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
