import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  FilmsBloc() : super(FilmsInitial());

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
