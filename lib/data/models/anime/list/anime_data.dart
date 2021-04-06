import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';

class AnimeData {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Top> top;

  AnimeData(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.top});

  AnimeData.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['top'] != null) {
      top = <Top>[];
      json['top'].forEach((v) {
        top.add(new Top.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.top != null) {
      data['top'] = this.top.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
