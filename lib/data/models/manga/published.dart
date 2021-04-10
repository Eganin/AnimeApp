import 'package:anime_app/data/models/anime/detail/from.dart';

class Published {
  String from;
  String to;
  Prop prop;
  String string;

  Published({this.from, this.to, this.prop, this.string});

  Published.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    prop = json['prop'] != null ? new Prop.fromJson(json['prop']) : null;
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    if (this.prop != null) {
      data['prop'] = this.prop.toJson();
    }
    data['string'] = this.string;
    return data;
  }
}

class Prop {
  From from;
  From to;

  Prop({this.from, this.to});

  Prop.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    to = json['to'] != null ? new From.fromJson(json['to']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.from != null) {
      data['from'] = this.from.toJson();
    }
    if (this.to != null) {
      data['to'] = this.to.toJson();
    }
    return data;
  }
}
