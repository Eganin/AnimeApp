import 'package:anime_app/data/models/anime/detail/recommendation/recommendations.dart';

class AnimeRecommendation {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Recommendations> recommendations;

  AnimeRecommendation(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.recommendations});

  AnimeRecommendation.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['recommendations'] != null) {
      recommendations = [];
      json['recommendations'].forEach((v) {
        recommendations.add(new Recommendations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.recommendations != null) {
      data['recommendations'] =
          this.recommendations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
