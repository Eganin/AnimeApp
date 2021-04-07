class Recommendations {
  int malId;
  String url;
  String imageUrl;
  String recommendationUrl;
  String title;
  int recommendationCount;

  Recommendations(
      {this.malId,
        this.url,
        this.imageUrl,
        this.recommendationUrl,
        this.title,
        this.recommendationCount});

  Recommendations.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    recommendationUrl = json['recommendation_url'];
    title = json['title'];
    recommendationCount = json['recommendation_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['recommendation_url'] = this.recommendationUrl;
    data['title'] = this.title;
    data['recommendation_count'] = this.recommendationCount;
    return data;
  }
}