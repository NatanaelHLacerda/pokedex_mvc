import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_mvc/mvc/model/pokemon_model.dart';
import 'package:pokedex_mvc/mvc/model/url_pokemons_model.dart';

class HomeController {
  final String url = 'https://pokeapi.co/api/v2/pokemon';

  Future<List> urlPokemons() async {
    var response = await http.get(Uri.parse(url));

    final responseBody = jsonDecode(response.body)['results'];

    return responseBody.map((e) => UrlPokemonModel.fromMap(e)).toList();
  }

  Future getPokemon(String name) async {
    final String url = 'https://pokeapi.co/api/v2/pokemon/$name';

    var response = await http.get(Uri.parse(url));

    final responseBody = jsonDecode(response.body);

    return toMap(responseBody);
  }
}
