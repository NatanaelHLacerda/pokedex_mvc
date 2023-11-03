import 'package:flutter/material.dart';
import 'package:pokedex_mvc/mvc/controller/home_controller.dart';
import 'package:pokedex_mvc/mvc/core/utils/custom_search_delegate.dart';
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
        actions: [
          IconButton(
              onPressed: () => showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(controller: controller)),
              icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder(
          future: controller.urlPokemons(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final UrlPokemonModel url = snapshot.data![index];
                    return FutureBuilder(
                        future: controller.getPokemon(url.name),
                        builder: (context, snapshot) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: pokemon.types
                                          .map((e) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
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
                        });
                  });
            }
            return Container();
          })),
    );
  }
}
