// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) {
  return Film(
    film_id: json['film_id'] as int,
    title: json['title'] as String,
    release_date: json['release_date'] as String,
    genres: json['genres'] as String,
    background_image: json['background_image'] as String,
    description: json['description'] as String,
    poster: json['poster'] as String,
    rating: json['rating'] as String,
  );
}

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'film_id': instance.film_id,
      'title': instance.title,
      'release_date': instance.release_date,
      'genres': instance.genres,
      'background_image': instance.background_image,
      'rating': instance.rating,
      'poster': instance.poster,
      'description': instance.description,
    };
