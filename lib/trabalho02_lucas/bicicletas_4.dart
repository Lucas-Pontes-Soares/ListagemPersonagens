import 'package:flutter/material.dart';

// Desenvolvido por Lucas Pontes Soares 1°DS AMS FATEC

class Bicicletas extends StatelessWidget {
  var _qtdEmpregados = TextEditingController();
  var _salarioMinimo = TextEditingController();
  var _precoCusto = TextEditingController();
  var _bicicletasVend = TextEditingController();
  var _salarioFinal = TextEditingController();
  var _lucro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '4. Bicicletas',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text('Informe os dados para calcular os salarios e lucro '),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: _qtdEmpregados,
                    decoration: InputDecoration(
                        label: Text('Quantidade de empregados:  ')),
                  ),
                  TextField(
                    controller: _salarioMinimo,
                    decoration: InputDecoration(
                        label: Text('Valor do salário minimo:  ')),
                  ),
                  TextField(
                    controller: _precoCusto,
                    decoration: InputDecoration(
                        label: Text('Preço de custo de cada bicicleta:  ')),
                  ),
                  TextField(
                    controller: _bicicletasVend,
                    decoration:
                        InputDecoration(label: Text('Bicicletas vendidas:  ')),
                  ),
                  TextField(
                    controller: _salarioFinal,
                    decoration: InputDecoration(
                        label: Text('Salário Final de cada empregado:  ')),
                  ),
                  TextField(
                    controller: _lucro,
                    decoration: InputDecoration(label: Text('Lucro da loja')),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FilledButton(
                      onPressed: () {
                        var qtdEmpregados =
                            int.tryParse(_qtdEmpregados.text) ?? 0;
                        var salarioMinimo =
                            double.tryParse(_salarioMinimo.text) ?? 0.0;
                        var precoCusto =
                            double.tryParse(_precoCusto.text) ?? 0.0;
                        var bicicletasVend =
                            int.tryParse(_bicicletasVend.text) ?? 0;

                        var precoVenda = precoCusto * 1.5;
                        var totalVendas = precoVenda * bicicletasVend;
                        var lucroBruto =
                            totalVendas - (precoCusto * bicicletasVend);

                        var comissaoTotal = 0.15 * precoCusto * bicicletasVend;
                        var salarioBaseTotal =
                            salarioMinimo * 2 * qtdEmpregados;
                        var salarioFinal =
                            salarioMinimo * 2 + (comissaoTotal / qtdEmpregados);

                        var lucroLiquido =
                            lucroBruto - salarioBaseTotal - comissaoTotal;

                        _salarioFinal.text = salarioFinal.toStringAsFixed(2);
                        _lucro.text = lucroLiquido.toStringAsFixed(2);
                      },
                      child: Text('Calcular')),
                ],
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
