import 'dart:html';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recommend_me/models/film.dart';
import 'package:recommend_me/models/game.dart';
import 'package:recommend_me/views/game_details.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class PreviewGame extends StatelessWidget {
  final Game game;

  PreviewGame(this.game);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () => showDialog(
                context: context,
                builder: (context) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: GameDetails(game))),
            child: Column(
              children: [
                Container(
                    child: FadeInImage.memoryNetwork(
                        image: game.background_image,
                        placeholder: kTransparentImage,
                        fit: BoxFit.cover)),
                ContainerResponsive(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          game.title +
                              '\n' +
                              game.genres +
                              '\n' +
                              game.release_date.substring(0, 4),
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 12.w)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
