part of 'games_bloc.dart';

@immutable
abstract class GamesState {}

class GamesInitial extends GamesState {}

class GamesLoading extends GamesState {}

class GamesDownloaded extends GamesState {}
