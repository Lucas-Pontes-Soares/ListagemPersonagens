import 'package:aula/aula01/Estrutura.dart';
import 'package:aula/aula01/Ola_mundo.dart';
import 'package:aula/aula02/alinhamento.dart';
import 'package:aula/aula03/eventos.dart';
import 'package:aula/aula04/formatador.dart';
import 'package:aula/aula04/formatadorMoeda.dart';
import 'package:aula/aula05/validador.dart';
import 'package:aula/aula06/cartao.dart';
import 'package:aula/aula07/loja.dart';
import 'package:aula/prova02_lucas/visualizarPersonagens.dart';
import 'package:aula/trabalho01_lucas/calculadoraCombustivel.dart';
import 'package:aula/trabalho01_lucas/calculadoraIMC.dart';
import 'package:aula/trabalho01_lucas/produto.dart';
import 'package:aula/trabalho02_lucas/bicicletas_4.dart';
import 'package:aula/trabalho02_lucas/medidas_1.dart';
import 'package:aula/trabalho02_lucas/motorista_3.dart';
import 'package:aula/trabalho02_lucas/poupanca_2.dart';
import 'package:aula/trabalho03_lucas/Empresa.dart';
import 'package:aula/trabalho03_lucas/Pagamento.dart';
import 'package:aula/trabalho03_lucas/Pessoa.dart';
import 'package:aula/trabalho04_lucas/validadorRemedio.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [Locale('pt')],
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        ...GlobalCupertinoLocalizations.delegates,
        FormBuilderLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: VisualizarPersonagens(),
    );
  }
}
