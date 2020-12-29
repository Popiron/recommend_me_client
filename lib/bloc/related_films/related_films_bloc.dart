import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recommend_me/helpers/rest.dart';
import 'package:recommend_me/models/film.dart';

part 'related_films_event.dart';
part 'related_films_state.dart';

class RelatedFilmsBloc extends Bloc<RelatedFilmsEvent, RelatedFilmsState> {
  RelatedFilmsBloc() : super(RelatedFilmsInitial(-1));

  @override
  Stream<RelatedFilmsState> mapEventToState(
    RelatedFilmsEvent event,
  ) async* {
    if (event is RelatedFilmsInitEvent) {
      yield RelatedFilmsInitial(event.gameId);
    } else if (event is RelatedFilmsLoadingEvent) {
      yield RelatedFilmsLoading(event.gameId);
      relatedFilms(event.gameId);
    } else if (event is RelatedFilmsDownloadedEvent) {
      yield RelatedFilmsDownloaded(event.gameId, event.films);
    }
  }

  void relatedFilms(int gameId) async {
    var films = await Rest.getRelatedFilms(gameId);
    this.add(RelatedFilmsDownloadedEvent(gameId, films));
  }
}
