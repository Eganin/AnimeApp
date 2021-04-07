class Scores {
  int overall;
  int story;
  int animation;
  int sound;
  int character;
  int enjoyment;

  Scores(
      {this.overall,
        this.story,
        this.animation,
        this.sound,
        this.character,
        this.enjoyment});

  Scores.fromJson(Map<String, dynamic> json) {
    overall = json['overall'];
    story = json['story'];
    animation = json['animation'];
    sound = json['sound'];
    character = json['character'];
    enjoyment = json['enjoyment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overall'] = this.overall;
    data['story'] = this.story;
    data['animation'] = this.animation;
    data['sound'] = this.sound;
    data['character'] = this.character;
    data['enjoyment'] = this.enjoyment;
    return data;
  }
}