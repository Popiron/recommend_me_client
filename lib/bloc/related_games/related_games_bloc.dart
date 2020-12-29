import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recommend_me/helpers/rest.dart';
import 'package:recommend_me/models/game.dart';

part 'related_games_event.dart';
part 'related_games_state.dart';

class RelatedGamesBloc extends Bloc<RelatedGamesEvent, RelatedGamesState> {
  RelatedGamesBloc() : super(RelatedGamesInitial(-1));

  @override
  Stream<RelatedGamesState> mapEventToState(
    RelatedGamesEvent event,
  ) async* {
    if (event is RelatedGamesInitEvent) {
      yield RelatedGamesInitial(event.filmId);
    } else if (event is RelatedGamesLoadingEvent) {
      yield RelatedGamesLoading(event.filmId);
      relatedGames(event.filmId);
    } else if (event is RelatedGamesDownloadedEvent) {
      yield RelatedGamesDownloaded(event.filmId, event.games);
    }
  }

  void relatedGames(int filmId) async {
    var games = await Rest.getRelatedGames(filmId);
    this.add(RelatedGamesDownloadedEvent(filmId, games));
  }
}
