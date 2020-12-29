part of 'related_films_bloc.dart';

@immutable
abstract class RelatedFilmsState {
  int gameId;
  RelatedFilmsState(this.gameId);
}

class RelatedFilmsInitial extends RelatedFilmsState {
  int gameId;
  RelatedFilmsInitial(this.gameId) : super(gameId);
}

class RelatedFilmsLoading extends RelatedFilmsState {
  int gameId;
  RelatedFilmsLoading(this.gameId) : super(gameId);
}

class RelatedFilmsDownloaded extends RelatedFilmsState {
  int gameId;
  List<Film> films;
  RelatedFilmsDownloaded(this.gameId, this.films) : super(gameId);
}
