part of 'related_films_bloc.dart';

@immutable
abstract class RelatedFilmsEvent {}

class RelatedFilmsInitEvent extends RelatedFilmsEvent {
  int gameId;
  RelatedFilmsInitEvent(this.gameId);
}

class RelatedFilmsLoadingEvent extends RelatedFilmsEvent {
  int gameId;
  RelatedFilmsLoadingEvent(this.gameId);
}

class RelatedFilmsDownloadedEvent extends RelatedFilmsEvent {
  int gameId;
  List<Film> films;
  RelatedFilmsDownloadedEvent(this.gameId, this.films);
}
