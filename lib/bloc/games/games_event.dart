part of 'games_bloc.dart';

@immutable
abstract class GamesEvent {}

class GamesLoadingEvent extends GamesEvent {}

class GamesDownloadedEvent extends GamesEvent {}
