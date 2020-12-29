import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recommend_me/models/film.dart';
import 'package:recommend_me/models/game.dart';

class Rest {
  static const _URL_FILMS =
      'https://recommend-me-mvp-api.herokuapp.com/api/v1/films';
  static const _URL_GAMES =
      'https://recommend-me-mvp-api.herokuapp.com/api/v1/games';

  static Future<List<Film>> getFilms() async {
    var response = await http.get(_URL_FILMS);
    if (response.statusCode == 200) {
      var l = jsonDecode(response.body);
      List<Film> films = new List<Film>();
      l.forEach((element) {
        var f = Film.fromJson(element);
        films.add(f);
      });

      return films;
    } else {
      print('Something went wrong...');
    }
    return null;
  }

  static Future<List<Game>> getGames() async {
    var response = await http.get(_URL_GAMES);
    if (response.statusCode == 200) {
      var l = jsonDecode(response.body);
      List<Game> games = new List<Game>();
      l.forEach((element) {
        var g = Game.fromJson(element);
        games.add(g);
      });
      return games;
    } else {
      print('Something went wrong...');
    }
    return null;
  }

  static Future<List<Film>> getRelatedFilms(int gameId) async {
    var response = await http.get(_URL_GAMES + "/$gameId/related_films");
    if (response.statusCode == 200) {
      var l = jsonDecode(response.body);
      List<Film> films = new List<Film>();
      l.forEach((element) {
        var f = Film.fromJson(element);
        films.add(f);
      });
      return films;
    } else {
      print('Something went wrong...');
    }
    return null;
  }

  static Future<List<Game>> getRelatedGames(int filmId) async {
    var response = await http.get(_URL_FILMS + "/$filmId/related_games");
    if (response.statusCode == 200) {
      var l = jsonDecode(response.body);
      List<Game> games = new List<Game>();
      l.forEach((element) {
        var g = Game.fromJson(element);
        games.add(g);
      });
      return games;
    } else {
      print('Something went wrong...');
    }
    return null;
  }
}
