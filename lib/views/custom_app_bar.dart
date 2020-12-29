import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recommend_me/bloc/films/films_bloc.dart';
import 'package:recommend_me/bloc/games/games_bloc.dart';
import 'package:recommend_me/bloc/tabs/tabs_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      width: double.infinity,
      height: 800.h,
      //decoration: BoxDecoration(color: Color(0xFF3589a1)),
      child: Stack(
        children: [
          ContainerResponsive(
              alignment: Alignment.centerLeft,
              child: Image.network('assets/assets/logo.png')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContainerResponsive(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: BlocBuilder<TabsBloc, TabsState>(
                          builder: (context, state) {
                            if (state is TabFilms) {
                              BlocProvider.of<FilmsBloc>(context)
                                  .add(FilmsLoadingEvent());
                              return TextResponsive("Films",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          decoration:
                                              TextDecoration.underline));
                            } else {
                              return TextResponsive("Films",
                                  style: Theme.of(context).textTheme.headline4);
                            }
                          },
                        ),
                        onTap: () {
                          BlocProvider.of<TabsBloc>(context)
                              .add(ClickFilmsTabEvent());
                        },
                      )),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: BlocBuilder<TabsBloc, TabsState>(
                          buildWhen: (previousState, state) =>
                              state.runtimeType != previousState.runtimeType,
                          builder: (context, state) {
                            if (state is TabGames) {
                              BlocProvider.of<GamesBloc>(context)
                                  .add(GamesLoadingEvent());
                              return TextResponsive("Games",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          decoration:
                                              TextDecoration.underline));
                            } else {
                              return TextResponsive("Games",
                                  style: Theme.of(context).textTheme.headline4);
                            }
                          },
                        ),
                        onTap: () {
                          BlocProvider.of<TabsBloc>(context)
                              .add(ClickGamesTabEvent());
                        },
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
