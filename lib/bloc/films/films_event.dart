part of 'films_bloc.dart';

@immutable
abstract class FilmsEvent {}

class FilmsLoadingEvent extends FilmsEvent {}

class FilmsDownloadedEvent extends FilmsEvent {}
