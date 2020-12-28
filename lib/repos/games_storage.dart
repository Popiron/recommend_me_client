import 'package:recommend_me/helpers/rest.dart';
import 'package:recommend_me/models/game.dart';

class GamesStorage {
  List<Game> data;

  static GamesStorage _instance;

  GamesStorage._internal() {
    _instance = this;
  }

  factory GamesStorage() => _instance ?? GamesStorage._internal();

  void initData() async {
    data = await Rest.getGames();
  }
}
