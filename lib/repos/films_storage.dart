import 'package:recommend_me/models/film.dart';

class FilmsStorage {
  List<Film> data;

  static FilmsStorage _instance;

  FilmsStorage._internal() {
    _instance = this;
  }

  factory FilmsStorage() => _instance ?? FilmsStorage._internal();
}
