class TShirtCalculatorLogic {
  // Precios estáticos según el tamaño
  static const double small = 10.0; // Precio de talla pequeña
  static const double medium = 12.0; // Precio de talla media
  static const double large = 15.0; // Precio de talla grande

  // Método para calcular el precio sin descuento
  static double calculatePrice(String size, int numTShirts) {
    double pricePerShirt;

    // Asignamos el precio según el tamaño de la camiseta
    switch (size) {
      case 'small':
        pricePerShirt = small;
        break;
      case 'medium':
        pricePerShirt = medium;
        break;
      case 'large':
        pricePerShirt = large;
        break;
      default:
        pricePerShirt = 0.0;
    }

    return pricePerShirt * numTShirts; // Precio total para el número de camisetas
  }

  // Método para calcular el precio con descuento
  static double calculatePriceWithDiscount(String size, int numTShirts, String offer) {
    double basePrice = calculatePrice(size, numTShirts);
    double discount = 0.0;

    if (offer == '10%') {
      // Descuento del 10%
      discount = 0.1 * basePrice;
    } else if (offer == '20€') {
      // Descuento por cantidad, restando 20€
      discount = 20.0;
    }

    return basePrice - discount; // Aplicamos el descuento al precio base
  }
}
