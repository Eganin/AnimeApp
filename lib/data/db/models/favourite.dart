import 'package:anime_app/main.dart';

class Favourite {
  int id = null;
  int malId;
  String imageUrl = '';
  String name = '';
  String type = PageCharacter.ANIME.value;

  Favourite({
    this.id,
    this.malId,
    this.imageUrl,
    this.name,
    this.type,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['malId'] = malId;
    map['name'] = name;
    map['image_url'] = imageUrl;
    map['type'] = type;
    return map;
  }

  Favourite.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    malId = map['malId'];
    name = map['name'];
    imageUrl = map['image_url'];
    type = map['type'];
  }
}
