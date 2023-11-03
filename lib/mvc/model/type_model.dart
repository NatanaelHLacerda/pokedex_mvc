class TypeModel {
  final String name;

  TypeModel({required this.name});

  factory TypeModel.fromMap(Map map) {
    return TypeModel(name: map['type']['name']);
  }
}
