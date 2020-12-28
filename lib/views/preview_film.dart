import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recommend_me/models/film.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class PreviewFilm extends StatelessWidget {
  final Film film;

  PreviewFilm(this.film);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            child: Container(
          child: Column(
            children: [
              Container(
                  child: FadeInImage.memoryNetwork(
                      image: film.poster,
                      placeholder: kTransparentImage,
                      fit: BoxFit.cover)),
              ContainerResponsive(
                width: 100.w,
                height: 600.h,
                alignment: Alignment.topCenter,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        film.title +
                            '\n' +
                            film.genres +
                            '\n' +
                            film.release_date.substring(0, 4),
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
          ),
        )));
  }
}
