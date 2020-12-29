part of 'related_games_bloc.dart';

@immutable
abstract class RelatedGamesState {
  int filmId;
  RelatedGamesState(this.filmId);
}

class RelatedGamesInitial extends RelatedGamesState {
  int filmId;
  RelatedGamesInitial(this.filmId) : super(filmId);
}

class RelatedGamesLoading extends RelatedGamesState {
  int filmId;
  RelatedGamesLoading(this.filmId) : super(filmId);
}

class RelatedGamesDownloaded extends RelatedGamesState {
  int filmId;
  List<Game> games;
  RelatedGamesDownloaded(this.filmId, this.games) : super(filmId);
}
