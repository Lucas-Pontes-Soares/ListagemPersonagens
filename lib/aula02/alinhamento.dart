import 'package:flutter/material.dart';

class Alinhamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Alinhamento',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                TextField(
                  decoration:
                      InputDecoration(label: Text('Digite o primeiro valor')),
                ),
                TextField(
                  decoration:
                      InputDecoration(label: Text('Digite o segundo valor')),
                ),
                TextField(
                  decoration: InputDecoration(label: Text('O resultado é')),
                  readOnly: true,
                ),
                SizedBox(
                  height: 24,
                ),
                FilledButton(onPressed: () => {}, child: Text('Somar'))
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
