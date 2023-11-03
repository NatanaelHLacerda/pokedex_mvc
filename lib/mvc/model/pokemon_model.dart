class PokemonModel {
  final String image;

  PokemonModel({required this.image});
}

toMap (map) {
  return PokemonModel(image: map['sprites']['other']['official-artwork']['front_default']);
}