import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabs_event.dart';
part 'tabs_state.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(TabFilms());

  @override
  Stream<TabsState> mapEventToState(
    TabsEvent event,
  ) async* {
    if (event is ClickFilmsTabEvent) {
      yield TabFilms();
    } else if (event is ClickGamesTabEvent) {
      yield TabGames();
    }
  }
}
