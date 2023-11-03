class UrlPokemonModel {
  final String name;
  final String url;

  UrlPokemonModel({required this.name, required this.url});

  factory UrlPokemonModel.fromMap(dynamic map){
    return UrlPokemonModel(name: map['name'], url: map['url']);
  }
}