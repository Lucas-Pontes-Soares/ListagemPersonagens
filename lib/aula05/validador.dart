import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Validador extends StatelessWidget {
  var _n1 = TextEditingController();
  var _n2 = TextEditingController();
  var _result = TextEditingController();
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
            'Validador',
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
                  decoration:
                      InputDecoration(label: Text('Digite o primeiro valor')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter(casasDecimais: 2)
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    // FormBuilderValidators.min(1) para inteiro
                    // FormBuilderValidators.max(100) para inteiro

                    FormBuilderValidators.transform((valor) {
                      return UtilBrasilFields.converterMoedaParaDouble(valor!)
                          .toStringAsFixed(2);
                    },
                        FormBuilderValidators.min(0.25)
                            .and(FormBuilderValidators.max(1000.00))),
                  ]),
                ),
                TextFormField(
                  controller: _n2,
                  decoration:
                      InputDecoration(label: Text('Digite o segundo valor')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter(casasDecimais: 2)
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    // FormBuilderValidators.min(1) para inteiro
                    // FormBuilderValidators.max(100) para inteiro

                    FormBuilderValidators.transform((valor) {
                      return UtilBrasilFields.converterMoedaParaDouble(valor!)
                          .toStringAsFixed(2);
                    },
                        FormBuilderValidators.min(0.25)
                            .and(FormBuilderValidators.max(1000.00))),
                  ]),
                ),
                TextFormField(
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
                      if (_formulario.currentState!.validate()) {
                        var x =
                            UtilBrasilFields.converterMoedaParaDouble(_n1.text);
                        var y =
                            UtilBrasilFields.converterMoedaParaDouble(_n2.text);

                        var sum = x + y;
                        _result.text =
                            UtilBrasilFields.obterReal(sum, moeda: false);
                      }
                    },
                    child: Text('Somar'))
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
