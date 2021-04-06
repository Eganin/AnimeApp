import 'package:anime_app/data/models/anime/detail/other_data.dart';

class Related {
  List<OtherData> adaptation;
  List<OtherData> prequel;

  Related({this.adaptation, this.prequel});

  Related.fromJson(Map<String, dynamic> json) {
    if (json['Adaptation'] != null) {
      adaptation = [];
      json['Adaptation'].forEach((v) {
        adaptation.add(new OtherData.fromJson(v));
      });
    }
    if (json['Prequel'] != null) {
      prequel = [];
      json['Prequel'].forEach((v) {
        prequel.add(new OtherData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adaptation != null) {
      data['Adaptation'] = this.adaptation.map((v) => v.toJson()).toList();
    }
    if (this.prequel != null) {
      data['Prequel'] = this.prequel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}