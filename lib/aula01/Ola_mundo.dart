import 'package:flutter/material.dart';

// dart não precisa de public class
// não precisa de new nomeClasse()

class OlaMundo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text(
        'Ola corno',
      ),
    );
  }
}
