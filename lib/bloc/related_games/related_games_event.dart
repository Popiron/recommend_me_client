part of 'related_games_bloc.dart';

@immutable
abstract class RelatedGamesEvent {}

class RelatedGamesInitEvent extends RelatedGamesEvent {
  int filmId;
  RelatedGamesInitEvent(this.filmId);
}

class RelatedGamesLoadingEvent extends RelatedGamesEvent {
  int filmId;
  RelatedGamesLoadingEvent(this.filmId);
}

class RelatedGamesDownloadedEvent extends RelatedGamesEvent {
  int filmId;
  List<Game> games;
  RelatedGamesDownloadedEvent(this.filmId, this.games);
}
