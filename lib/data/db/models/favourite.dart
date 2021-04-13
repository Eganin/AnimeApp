class Favourite {
  int id = null;
  int malId;
  String type ='anime';
  String imageUrl ='';
  String name='';

  Favourite({this.id, this.malId, this.type, this.name});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['malId'] = malId;
    map['type'] = type;
    map['name'] = name;
    map['image_url'] = imageUrl;
    return map;
  }

  Favourite.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    malId = map['malId'];
    type = map['type'];
    name = map['name'];
    imageUrl = map['image_url'];
  }
}
