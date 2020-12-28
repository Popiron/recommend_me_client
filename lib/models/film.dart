import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable()
class Film {
  int film_id;
  String title;
  String release_date;
  String genres;
  String background_image;
  String rating;
  String poster;
  String description;

  Film(
      {this.film_id,
      this.title,
      this.release_date,
      this.genres,
      this.background_image,
      this.description,
      this.poster,
      this.rating});

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
