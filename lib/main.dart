import 'package:flutter/material.dart';
import 'package:nescafe_concept/coffee_concept_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: const ColorScheme.light(),
        useMaterial3: false,
      ),
      home: const CoffeeConceptList(),
    );
  }
}
