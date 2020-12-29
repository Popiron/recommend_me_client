import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommend_me/bloc/films/films_bloc.dart';
import 'package:recommend_me/repos/films_storage.dart';
import 'package:recommend_me/views/preview_film.dart';

class FilmsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmsBloc, FilmsState>(builder: (context, state) {
      if (state is FilmsLoading) {
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
      } else if (state is FilmsDownloaded) {
        return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => PreviewFilm(FilmsStorage().data[index]),
                childCount: FilmsStorage().data.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 100,
                crossAxisSpacing: 100,
                childAspectRatio: 1 / 2));
      } else {
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
      }
    });
  }
}
