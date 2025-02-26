import 'package:flutter/material.dart';
import 't_shirt_calculator_logic.dart';

class TShirtCalculatorScreen extends StatefulWidget {
  const TShirtCalculatorScreen({super.key});

  @override
  _TShirtCalculatorScreenState createState() => _TShirtCalculatorScreenState();
}

class _TShirtCalculatorScreenState extends State<TShirtCalculatorScreen> {
  static const double smallPrice = TShirtCalculatorLogic.small;
  static const double mediumPrice = TShirtCalculatorLogic.medium;
  static const double largePrice = TShirtCalculatorLogic.large;

  int? _numTShirts;
  String? _size;
  String? _offer;
  double _price = 0.0;

  void _calculatePrice() {
    if (_numTShirts == null || _size == null) {
      setState(() {
        _price = 0.0;
      });
      return;
    }

    if (_offer == null) {
      setState(() {
        _price = TShirtCalculatorLogic.calculatePrice(_size!, _numTShirts!);
      });
    } else {
      setState(() {
        _price = TShirtCalculatorLogic.calculatePriceWithDiscount(
            _size!, _numTShirts!, _offer!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora de Samarretes")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Samarretes',
                hintText: 'Número de samarretes',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _numTShirts = int.tryParse(value);
                  _calculatePrice();
                });
              },
            ),
            const Text('Talla'),
            RadioListTile(
              title: Text('Petita ($smallPrice €)'),
              value: 'small',
              groupValue: _size,
              onChanged: (value) {
                setState(() {
                  _size = value as String?;
                  _calculatePrice();
                });
              },
            ),
            RadioListTile(
              title: Text('Mitjana ($mediumPrice €)'),
              value: 'medium',
              groupValue: _size,
              onChanged: (value) {
                setState(() {
                  _size = value as String?;
                  _calculatePrice();
                });
              },
            ),
            RadioListTile(
              title: Text('Gran ($largePrice €)'),
              value: 'large',
              groupValue: _size,
              onChanged: (value) {
                setState(() {
                  _size = value as String?;
                  _calculatePrice();
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Oferta'),
            DropdownButton<String>(
              value: _offer,
              items: const [
                DropdownMenuItem(
                  value: '',
                  child: Text('Sense descompte'),
                ),
                DropdownMenuItem(
                  value: '10%',
                  child: Text('Descompte del 10%'),
                ),
                DropdownMenuItem(
                  value: '20€',
                  child: Text('Descompte per quantitat'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _offer = value;
                  _calculatePrice();
                });
              },
              hint: const Text('Selecciona una oferta'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Preu: $_price €',
                  style: const TextStyle(fontSize: 32),
                ),
                if (_offer == '20€') ...[
                  const SizedBox(width: 10),
                  const Text(
                    'Alerta: Descompte per quantitat aplicat!',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
