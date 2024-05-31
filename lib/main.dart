import 'package:flutter/material.dart';
import 'package:pokemon_app/screens/pokemon_list_screen.dart';
import 'service/api_service.dart';
import 'model/pokemon.dart';

void main() {
  runApp(PokemonApp());
}

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mobile_developer_test_dhila',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: PokemonListScreen(),
    );
  }
}
