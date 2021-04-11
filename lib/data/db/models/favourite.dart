class FavouriteAnime {
  int id;
  int malId;
  String type;
  String name;

  FavouriteAnime({this.id, this.malId, this.type, this.name});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['malId'] = malId;
    map['type'] = type;
    map['name'] = name;
    return map;
  }

  FavouriteAnime.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    malId = map['malId'];
    type = map['type'];
    name = map['name'];
  }
}
