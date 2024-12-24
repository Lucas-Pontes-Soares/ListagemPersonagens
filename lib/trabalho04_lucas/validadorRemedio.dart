import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ValidadorRemedio extends StatelessWidget {
  var _n1 = TextEditingController();
  var _n2 = TextEditingController();
  var _qtd = TextEditingController();
  var _dataF = TextEditingController();
  var _dataV = TextEditingController();
  var _preco = TextEditingController();
  var _formulario = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [Locale('pt')],
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        ...GlobalCupertinoLocalizations.delegates,
        FormBuilderLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Validador Remédio',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Form(
            key: _formulario,
            child: Column(
              children: [
                TextFormField(
                  controller: _n1,
                  decoration: InputDecoration(
                      label: Text('Digite o codigo do produto')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.min(1),
                    FormBuilderValidators.max(1000)
                  ]),
                ),
                TextFormField(
                  controller: _n2,
                  decoration:
                      InputDecoration(label: Text('Digite o nome do produto')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.alphabetical()
                  ]),
                ),
                TextFormField(
                  controller: _qtd,
                  decoration:
                      InputDecoration(label: Text('Digite a quantidade')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.min(1),
                    FormBuilderValidators.max(1000)
                  ]),
                ),
                TextFormField(
                  controller: _preco,
                  decoration: InputDecoration(label: Text('Digite o preço')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter(casasDecimais: 2)
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.transform((valor) {
                      return UtilBrasilFields.converterMoedaParaDouble(valor!)
                          .toStringAsFixed(2);
                    },
                        FormBuilderValidators.min(0.25)
                            .and(FormBuilderValidators.max(1000.00))),
                  ]),
                ),
                TextFormField(
                  controller: _dataF,
                  decoration: InputDecoration(
                      label: Text('Digite a data de fabricação')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter()
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.transform(
                      (valor) {
                        DateTime dataValida = UtilData.obterDateTime(valor!);
                        return dataValida.toString();
                      },
                      FormBuilderValidators.datePast(),
                    ),
                  ]),
                ),
                TextFormField(
                  controller: _dataV,
                  decoration:
                      InputDecoration(label: Text('Digite a data de validade')),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter()
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.transform(
                      (valor) {
                        DateTime dataValida = UtilData.obterDateTime(valor!);
                        return dataValida.toString();
                      },
                      FormBuilderValidators.dateFuture(),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 24,
                ),
                FilledButton(
                    onPressed: () {
                      if (_formulario.currentState!.validate()) {}
                    },
                    child: Text('Validar')),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
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
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
