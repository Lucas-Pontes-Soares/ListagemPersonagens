import 'package:aula/prova02_lucas/visualizarPersonagens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Prova 02 - Lucas Pontes Soares 1 ADS

class AdicionarPersonagem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdicionarPersonagem();
  }
}

class _AdicionarPersonagem extends State<AdicionarPersonagem> {
  var dio = Dio();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();
  final TextEditingController _universeController = TextEditingController();
  var _formulario = GlobalKey<FormState>();

  Future<void> adicionarPersonagem() async {
    try {
      final response = await dio.post(
          "https://673cc3bb96b8dcd5f3fb8731.mockapi.io/characters",
          data: {
            "name": _nameController.text,
            "description": _descriptionController.text,
            "avatar": _avatarController.text,
            "universe": _universeController.text,
          });

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Personagem adicionado com sucesso!')),
        );

        _nameController.clear();
        _descriptionController.clear();
        _avatarController.clear();
        _universeController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar personagem.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ocorreu um erro: $e')),
      );
    }
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar personagem'),
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
                  'Visualizar personagens:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VisualizarPersonagens()),
                    );
                  },
                  child: Text('Clique aqui'),
                ),
              ],
            ),
          ),
          Expanded(
              child: Form(
                  key: _formulario,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Text('Informe todos os dados para criar um personagem'),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration:
                            InputDecoration(label: Text('Nome Completo')),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z ]")),
                        ],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(label: Text('Descrição')),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(200)
                        ],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      TextFormField(
                        controller: _avatarController,
                        decoration: InputDecoration(label: Text('URL Avatar')),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(200)
                        ],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      TextFormField(
                        controller: _universeController,
                        decoration: InputDecoration(label: Text('Universo')),
                        inputFormatters: [LengthLimitingTextInputFormatter(20)],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FilledButton(
                          onPressed: () => {
                                if (_formulario.currentState!.validate())
                                  {adicionarPersonagem()}
                              },
                          child: Text('Adicionar')),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
