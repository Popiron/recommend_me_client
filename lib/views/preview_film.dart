import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recommend_me/models/film.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class PreviewFilm extends StatelessWidget {
  // Film film;

  // PreviewFilm(this.film);

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      width: 100.w,
      height: 1500.h,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/GD9nfxw68XWBreHeEq2Jz28qeb.jpg"),
          ),
          ContainerResponsive(
              height: 250,
              width: 100.w,
              decoration: BoxDecoration(color: Colors.black38),
              alignment: Alignment.bottomCenter,
              child: Text(
                "dasdasd",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
