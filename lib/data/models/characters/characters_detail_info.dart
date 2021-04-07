import 'package:anime_app/data/models/characters/staff.dart';

import 'characters.dart';

class CharactersDetailInfo {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Characters> characters;
  List<Staff> staff;

  CharactersDetailInfo(
      {this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.characters,
        this.staff});

  CharactersDetailInfo.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['characters'] != null) {
      characters = [];
      json['characters'].forEach((v) {
        characters.add(new Characters.fromJson(v));
      });
    }
    if (json['staff'] != null) {
      staff = [];
      json['staff'].forEach((v) {
        staff.add(new Staff.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.characters != null) {
      data['characters'] = this.characters.map((v) => v.toJson()).toList();
    }
    if (this.staff != null) {
      data['staff'] = this.staff.map((v) => v.toJson()).toList();
    }
    return data;
  }
}