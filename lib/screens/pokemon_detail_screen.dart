import 'package:flutter/material.dart';
import 'package:pokemon_app/widget/stat_row_widget.dart';
import '../model/pokemon.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorByType(pokemon.types),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: getColorByType(pokemon.types),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    SizedBox(height: 80), // space for the image
                    TabBar(
                      labelColor: Colors.black, // Color of the selected tab
                      unselectedLabelColor:
                          Colors.grey, // Color of the unselected tabs
                      tabs: [
                        Tab(text: 'About'),
                        Tab(text: 'Base Stats'),
                        Tab(text: 'Evolution'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListView(
                              children: [
                                _buildRow('Height', '${pokemon.height / 10} m'),
                                _buildRow(
                                    'Weight', '${pokemon.weight / 10} kg'),
                                _buildAbilitiesRow(
                                    'Abilities', pokemon.abilities),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Base Stats',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                ...pokemon.stats
                                    .map((stat) => StatRowWidget(
                                        stat: stat.name, value: stat.baseStat))
                                    .toList(),
                              ],
                            ),
                          ),
                          Center(
                            child: Text('Evolution details go here'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: pokemon.id,
                child: Image.network(
                  pokemon.sprite,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '#00${pokemon.id.toString()}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: pokemon.types
                      .map((type) => Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Chip(
                              label: Text(type),
                              backgroundColor: getColorByType(pokemon.types),
                              labelStyle: TextStyle(color: Colors.white),
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Color getColorByType(List<String> types) {
    if (types.contains('fire')) return Colors.red.shade300;
    if (types.contains('grass')) return Colors.green.shade300;
    if (types.contains('water')) return Colors.blue.shade300;
    return Colors.grey.shade300;
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildAbilitiesRow(String label, List<String> abilities) {
    String abilitiesText = abilities.join(', ');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            abilitiesText,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
