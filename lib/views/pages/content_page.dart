import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommend_me/bloc/films/films_bloc.dart';
import 'package:recommend_me/bloc/games/games_bloc.dart';
import 'package:recommend_me/bloc/tabs/tabs_bloc.dart';
import 'package:recommend_me/repos/films_storage.dart';
import 'package:recommend_me/repos/games_storage.dart';
import 'package:recommend_me/views/custom_app_bar.dart';
import 'package:recommend_me/views/films_grid.dart';
import 'package:recommend_me/views/games_grid.dart';
import 'package:recommend_me/views/preview_film.dart';
import 'package:recommend_me/views/preview_game.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    return ResponsiveWidgets.builder(
        height: 1920, // Optional
        width: 1080, // Optional
        allowFontScaling: true, // Optional
        child: Scaffold(
          backgroundColor: Color(0xFF171717),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildListDelegate([
                    CustomAppBar(),
                  ])),
                  BlocBuilder<TabsBloc, TabsState>(
                    builder: (context, state) {
                      if (state is TabFilms) {
                        return FilmsGrid();
                      } else if (state is TabGames) {
                        return GamesGrid();
                      }
                    },
                  ),
                ],
              ),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
