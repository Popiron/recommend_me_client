part of 'films_bloc.dart';

@immutable
abstract class FilmsState {}

class FilmsInitial extends FilmsState {}

class FilmsLoading extends FilmsState {}

class FilmsDownloaded extends FilmsState {}
