part of 'tabs_bloc.dart';

@immutable
abstract class TabsEvent {}

class ClickFilmsTabEvent extends TabsEvent {}

class ClickGamesTabEvent extends TabsEvent {}
