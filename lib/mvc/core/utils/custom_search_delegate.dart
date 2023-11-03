import 'package:flutter/material.dart';
import 'package:pokedex_mvc/mvc/controller/home_controller.dart';
import 'package:pokedex_mvc/mvc/model/pokemon_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  final HomeController controller;

  CustomSearchDelegate({required this.controller});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: controller.getPokemon(query),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final PokemonModel pokemon = snapshot.data;

            return Card(
              child: Container(
                child: Column(
                  children: [
                    Text(pokemon.name),
                    Image.network(
                      pokemon.image,
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pokemon.types
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(e.name),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
