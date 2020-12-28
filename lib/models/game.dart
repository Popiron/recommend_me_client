import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game {
  int game_id;
  String title;
  String release_date;
  String genres;
  String rating;
  String background_image;
  String description;

  Game(
      {this.game_id,
      this.title,
      this.release_date,
      this.genres,
      this.rating,
      this.background_image,
      this.description});

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
