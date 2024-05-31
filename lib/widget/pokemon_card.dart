import "package:flutter/material.dart";
import "../model/pokemon.dart";
import "../screens/pokemon_detail_screen.dart";

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final Color color;

  PokemonCard({required this.pokemon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetailScreen(pokemon: pokemon),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PokemonInfo(pokemon: pokemon, color: color),
            Expanded(
              child: Hero(
                tag: pokemon.id,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(pokemon.sprite),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonInfo extends StatelessWidget {
  final Pokemon pokemon;
  final Color color;

  PokemonInfo({required this.pokemon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pokemon.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: pokemon.types
                .map(
                  (type) => Chip(
                    label: Text(type),
                    backgroundColor: color,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
