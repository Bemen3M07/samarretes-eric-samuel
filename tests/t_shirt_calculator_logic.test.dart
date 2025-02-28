import 'package:flutter_test/flutter_test.dart';
import 'package:empty/t_shirt_calculator_logic.dart';

void main() {
  group('TShirtCalculatorLogic - Cálculo de Precios', () {
    test('L\'usuari introdueix lletres en comptes de números', () {
      expect(() => TShirtCalculatorLogic.calculatePrice('small', int.parse('abc')), throwsFormatException);
    });

    test('Càlcul del preu de samarretes sense descompte ni talla', () {
      expect(TShirtCalculatorLogic.calculatePrice('', 10), 0);
    });

    test('Càlcul del preu de samarretes amb descompte 10% i sense talla', () {
      expect(TShirtCalculatorLogic.calculatePriceWithDiscount('', 10, '10%'), 0);
    });

    test('Càlcul del preu de samarretes sense descompte i amb talla', () {
      expect(TShirtCalculatorLogic.calculatePrice('small', 10), 100);
    });

    test('Càlcul del preu de samarretes amb descompte 10% i amb talla', () {
      expect(TShirtCalculatorLogic.calculatePriceWithDiscount('small', 1, '10%'), 9);
    });

    test('Mostra el text d\'alerta descompte de 10%', () {
      final price = TShirtCalculatorLogic.calculatePriceWithDiscount('small', 1, '10%');
      expect(price, 9);
      expect(price < TShirtCalculatorLogic.calculatePrice('small', 1), true);
    });

    test('Càlcul del preu de samarretes amb descompte per quantitat i amb talla', () {
      expect(TShirtCalculatorLogic.calculatePriceWithDiscount('small', 10, '20€'), 80);
    });

    test('Mostra el text d\'alerta descompte per quantitat', () {
      final price = TShirtCalculatorLogic.calculatePriceWithDiscount('small', 10, '20€');
      expect(price, 80);
      expect(price < TShirtCalculatorLogic.calculatePrice('small', 10), true);
    });

    test('L\'usuari clica 2 talles diferents', () {
      expect(TShirtCalculatorLogic.calculatePrice('medium', 10), 120);
    });

    test('L\'usuari selecciona 2 descomptes diferents', () {
      final priceWithQuantityDiscount = TShirtCalculatorLogic.calculatePriceWithDiscount('large', 10, '20€');
      final priceWithTenPercent = TShirtCalculatorLogic.calculatePriceWithDiscount('large', 10, '10%');

      expect(priceWithTenPercent, 135);
      expect(priceWithTenPercent < priceWithQuantityDiscount, false);
    });
  });
}
