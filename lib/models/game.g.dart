// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    game_id: json['game_id'] as int,
    title: json['title'] as String,
    release_date: json['release_date'] as String,
    genres: json['genres'] as String,
    rating: json['rating'] as String,
    background_image: json['background_image'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'game_id': instance.game_id,
      'title': instance.title,
      'release_date': instance.release_date,
      'genres': instance.genres,
      'rating': instance.rating,
      'background_image': instance.background_image,
      'description': instance.description,
    };
