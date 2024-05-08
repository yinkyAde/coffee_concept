import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

final coffeeGradients = [
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white54, Colors.brown.shade800],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0XffBE7D3C).withOpacity(0.5), const Color(0xffA97E48)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0Xff8B221C).withOpacity(0.5), const Color(0xffA97E48)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0XffEFDEC0).withOpacity(0.5), const Color(0xff7C4B2C)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0XffEADBBC).withOpacity(0.5), const Color(0xff67311D)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0XffEADBBC).withOpacity(0.5), const Color(0xff67311D)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0XffEFDEC0).withOpacity(0.3), const Color(0xff7C4B2C)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0XffEFDEC0).withOpacity(0.3), const Color(0xff3A0804)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0XffDFD5CC).withOpacity(0.3), const Color(0xffA3714B)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0Xff8F5134).withOpacity(0.3), const Color(0xff6D3C23)],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0XffE3E8E9).withOpacity(0.3), const Color(0xffD2A974)],
  ),
  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white, Colors.white],
  ),
  // Add more gradients for each coffee item as needed
];