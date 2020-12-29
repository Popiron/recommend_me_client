import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recommend_me/helpers/rest.dart';
import 'package:recommend_me/models/game.dart';
import 'package:recommend_me/repos/films_storage.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  FilmsBloc() : super(FilmsLoading());

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    if (event is FilmsLoadingEvent) {
      yield FilmsLoading();
      loadFilms();
    } else if (event is FilmsDownloadedEvent) {
      yield FilmsDownloaded();
    }
  }

  void loadFilms() async {
    FilmsStorage().data = await Rest.getFilms();
    this.add(FilmsDownloadedEvent());
  }
}
