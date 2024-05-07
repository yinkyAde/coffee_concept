import 'dart:math';

class Coffee {
  Coffee({required this.name, required this.image, required this.price});

  final String name;
  final String image;
  final double price;
}


double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + 0;


final random = Random();
final coffees = List.generate(
  _names.length,
      (index) =>
      Coffee(
          name: _names[index],
          image: 'assets/coffee/${index + 1}.png',
          price: _doubleInRange(random, 3, 7),
));

//
// final _names = [
//   'NESCAFÉ® Intense Can',
//   'NESCAFÉ® Iced Latté Can',
//   'NESCAFÉ® Cans Original',
//   'NESCAFÉ® Kopi Mocha',
//   'NESCAFÉ® Black Ice Can'
// ];

final _names = [
  'Caramel Macchiato',
  'Caramel Cold Drink',
  'Iced Coffe Mocha',
  'Caramelized Pecan Latte',
  'Toffee Nut Latte',
  'Capuchino',
  'Toffee Nut Iced Latte',
  'Americano',
  'Vietnamese-Style Iced Coffee',
  'Black Tea Latte',
  'Classic Irish Coffee',
  'Toffee Nut Crunch Latte'
];