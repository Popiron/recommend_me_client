import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommend_me/bloc/films/films_bloc.dart';
import 'package:recommend_me/bloc/related_films/related_films_bloc.dart';
import 'package:recommend_me/bloc/related_games/related_games_bloc.dart';
import 'package:recommend_me/models/film.dart';
import 'package:recommend_me/models/game.dart';
import 'package:recommend_me/views/preview_film.dart';
import 'package:recommend_me/views/preview_game.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class GameDetails extends StatelessWidget {
  final Game game;

  GameDetails(this.game);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RelatedGamesBloc>(context)
        .add(RelatedGamesInitEvent(game.game_id));
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate([
          Column(
            children: [
              Stack(children: [
                ContainerResponsive(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    width: 400.w,
                    height: 3000.h,
                    child: FadeInImage.memoryNetwork(
                        image: game.background_image,
                        placeholder: kTransparentImage,
                        fit: BoxFit.cover)),
                Positioned.fill(
                  top: 600.h,
                  child: Stack(children: [
                    ContainerResponsive(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                          color: Colors.black54),
                      width: 400.w,
                      height: 1500.h,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                game.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                game.genres,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Colors.white, fontSize: 10.w),
                              ),
                              Text(
                                game.release_date.substring(0, 4),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Colors.white, fontSize: 10.w),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      game.description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ]),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () => BlocProvider.of<RelatedFilmsBloc>(context)
                          .add(RelatedFilmsLoadingEvent(game.game_id)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ContainerResponsive(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white),
                          width: 400.w,
                          height: 100.w,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Find related films",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        fontSize: 20.0.w, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ))),
            ],
          ),
        ]),
      ),
      BlocBuilder<RelatedFilmsBloc, RelatedFilmsState>(
          builder: (context, state) {
        if (state.gameId == game.game_id) {
          if (state is RelatedFilmsLoading) {
            return SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ]),
            );
          } else if (state is RelatedFilmsDownloaded) {
            if (state.gameId == game.game_id)
              return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => PreviewFilm(state.films[index]),
                      childCount: state.films.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 100.h,
                      crossAxisSpacing: 100.w,
                      childAspectRatio: 1 / 2));
          } else {
            return SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  width: 1,
                  height: 1,
                ),
              ]),
            );
          }
        } else {
          return SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: 1,
                height: 1,
              ),
            ]),
          );
        }
      }),
    ]);
  }
}
