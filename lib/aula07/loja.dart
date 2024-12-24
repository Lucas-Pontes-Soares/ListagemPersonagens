import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loja extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Loja();
  }
}

class _Loja extends State<Loja> {
  var dio = Dio();
  var produtos = [];

  void listar() async {
    var resposta = await dio.get("https://api.escuelajs.co/api/v1/products");
    produtos = resposta.data;
    setState(() {});
  }

  @override
  void initState() {
    listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Loja'),
        ),
        body: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(50),
              child: Column(children: [
                Text('Código: ${produtos[index]['id']}'),
                Text('Titulo: ${produtos[index]['title']}'),
                Image.network('${produtos[index]['images'][0]}'),
                Text('Descrição: ${produtos[index]['description']}'),
                Text('Preço: ${produtos[index]['price']}'),
              ]),
            );
          },
        ));
  }
}
