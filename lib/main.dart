import 'package:flutter/material.dart';
import 'main_2.dart'; // Importamos correctamente la pantalla

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Samarretes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TShirtCalculatorScreen(), // Usamos el widget correctamente
    );
  }
}