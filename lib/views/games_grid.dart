import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommend_me/bloc/games/games_bloc.dart';
import 'package:recommend_me/repos/games_storage.dart';
import 'package:recommend_me/views/preview_game.dart';

class GamesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesBloc, GamesState>(
        // buildWhen: (previousState, state) =>
        //     state.runtimeType != previousState.runtimeType,
        builder: (context, state) {
      if (state is GamesLoading) {
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
      } else if (state is GamesDownloaded) {
        return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => PreviewGame(GamesStorage().data[index]),
                childCount: GamesStorage().data.length),
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
