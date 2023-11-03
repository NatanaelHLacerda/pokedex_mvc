import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedex_mvc/mvc/controller/home_controller.dart';
import 'package:pokedex_mvc/mvc/model/pokemon_model.dart';
import 'package:pokedex_mvc/mvc/model/url_pokemons_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController();
    controller.urlPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: FutureBuilder(
          future: controller.urlPokemons(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final UrlPokemonModel url = snapshot.data![index];
                    return FutureBuilder(
                        future: controller.getPokemon(url.name),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print('============= chegou aqui ===========');
                            final PokemonModel pokemon = snapshot.data;
                            final pokemonList = snapshot.data;
                            return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 20),
                                itemCount: pokemonList,
                                itemBuilder: (context, index) {
                                  return Container(
                                    
                                  );
                                });
                          }
                          return Container();
                        });
                  });
            }
            return Container();
          })),
    );
  }
}
