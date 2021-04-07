import 'package:anime_app/data/models/anime/detail/reviews/reviews.dart';

class AnimeReviews {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Reviews> reviews;

  AnimeReviews(
      {this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.reviews});

  AnimeReviews.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}