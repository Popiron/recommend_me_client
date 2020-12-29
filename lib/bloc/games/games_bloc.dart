import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recommend_me/helpers/rest.dart';
import 'package:recommend_me/repos/games_storage.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc() : super(GamesInitial());

  @override
  Stream<GamesState> mapEventToState(
    GamesEvent event,
  ) async* {
    if (event is GamesLoadingEvent) {
      yield GamesLoading();
      loadGames();
    } else if (event is GamesDownloadedEvent) {
      yield GamesDownloaded();
    }
  }

  void loadGames() async {
    GamesStorage().data = await Rest.getGames();
    this.add(GamesDownloadedEvent());
  }
}
