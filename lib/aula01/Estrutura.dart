import 'package:flutter/material.dart';

// dart não precisa de public class
// não precisa de new nomeClasse()

class Estrutura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Meu segundo Programa",
          ),
        ),
        body: Text("Olá mundo"),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
