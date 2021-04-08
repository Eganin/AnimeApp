import 'package:anime_app/data/models/characters/voice_actors.dart';

import 'animeography.dart';

class CharactersDetail {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int malId;
  String url;
  String name;
  String nameKanji;
  List<String> nicknames;
  String about;
  int memberFavorites;
  String imageUrl;
  List<Animeography> animeography;
  List<Animeography> mangaography;
  List<VoiceActors> voiceActors;

  CharactersDetail(
      {this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.malId,
        this.url,
        this.name,
        this.nameKanji,
        this.nicknames,
        this.about,
        this.memberFavorites,
        this.imageUrl,
        this.animeography,
        this.mangaography,
        this.voiceActors});

  CharactersDetail.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    malId = json['mal_id'];
    url = json['url'];
    name = json['name'];
    nameKanji = json['name_kanji'];
    if (json['nicknames'] != null) {
      nicknames = [];
      json['nicknames'].forEach((v) {
        nicknames.add(v);
      });
    }
    about = json['about'];
    memberFavorites = json['member_favorites'];
    imageUrl = json['image_url'];
    if (json['animeography'] != null) {
      animeography = [];
      json['animeography'].forEach((v) {
        animeography.add(new Animeography.fromJson(v));
      });
    }
    if (json['mangaography'] != null) {
      mangaography = [];
      json['mangaography'].forEach((v) {
        mangaography.add(new Animeography.fromJson(v));
      });
    }
    if (json['voice_actors'] != null) {
      voiceActors = new List<VoiceActors>();
      json['voice_actors'].forEach((v) {
        voiceActors.add(new VoiceActors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['name'] = this.name;
    data['name_kanji'] = this.nameKanji;
    if (this.nicknames != null) {
      data['nicknames'] = this.nicknames.map((v) => v).toList();
    }
    data['about'] = this.about;
    data['member_favorites'] = this.memberFavorites;
    data['image_url'] = this.imageUrl;
    if (this.animeography != null) {
      data['animeography'] = this.animeography.map((v) => v.toJson()).toList();
    }
    if (this.mangaography != null) {
      data['mangaography'] = this.mangaography.map((v) => v.toJson()).toList();
    }
    if (this.voiceActors != null) {
      data['voice_actors'] = this.voiceActors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}