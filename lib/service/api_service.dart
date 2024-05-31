import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/pokemon.dart';

class ApiService {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse('$baseUrl?limit=20'));

    if (response.statusCode == 200) {
      List pokemons = json.decode(response.body)['results'];
      List<Pokemon> detailedPokemons = [];

      for (var pokemon in pokemons) {
        final pokemonDetails = await fetchPokemonDetailsByUrl(pokemon['url']);
        detailedPokemons.add(pokemonDetails);
      }
      return detailedPokemons;
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }

  Future<Pokemon> fetchPokemonDetailsByUrl(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }
}
