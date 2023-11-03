import 'package:pokedex_mvc/mvc/model/type_model.dart';

class PokemonModel {
  final String image;
  final String name;
  final List<TypeModel> types;

  PokemonModel({required this.image, required this.name, required this.types});

  // factory PokemonModel.fromMap(Map map) {
  //   return PokemonModel(
  //       image: map['sprites']['other']['official-artwork']['front_default'],
  //       name: map['name'],
  //       types: map['types']);
  // }
}

toMap(Map map) {
  return PokemonModel(
    image: map['sprites']['other']['official-artwork']['front_default'],
    name: map['name'],
    types: (map['types'] as List).map((e) => TypeModel.fromMap(e)).toList(),
  );
}
