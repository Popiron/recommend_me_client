import 'package:recommend_me/helpers/rest.dart';
import 'package:recommend_me/models/film.dart';

class FilmsStorage {
  List<Film> data = new List<Film>();

  static FilmsStorage _instance;

  FilmsStorage._internal() {
    _instance = this;
  }

  factory FilmsStorage() => _instance ?? FilmsStorage._internal();

  // initData() async {
  //   data = await Rest.getFilms();
  // }
}
